class AdminController < ApplicationController
    before_action :admin_authenticate
    
    # Management - users
    def users_index
        print User.all
        @users = User.all
    end
    
    def user_edit
        @user_edit = User.where(" id = ?", params[:id])[0]
    end
    
    def user_update
        @user_edit = User.where(" id = ?", params[:user][:id])[0]
        if @user_edit.update(user_params)
            redirect_to controller: 'admin', action: 'users_index'
        else
            render user_edit
        end
    end
    
    def user_delete
        @user_delete = User.where(" id = ?", params[:id])[0]
        @user_delete.delete
        
        redirect_to controller: 'admin', action: 'users_index'
    end
    
    #management book
    def books_index
        @books = Book.all.order('created_at DESC')
    end
    
    def book_edit
        @book = Book.find(params[:id])
        if( params[:commit] == 'delete' )
            if !@book.picture.nil?
                filepath = Rails.root.join('app','assets','images','upload_books',@book.picture)
                File.delete( filepath ) if File.exist?( filepath )
            end
            @book.destroy
            redirect_to controller: 'admin', action: 'books_index'
        end
    end
    
    def book_update
        @book = Book.find( params[:book][:id] )
        
        if @book.update(book_params)
            if !params[:book][:picture].nil?
                #delete original picture
                filepath = Rails.root.join('app','assets','images','upload_books',@book.picture)
                File.delete( filepath ) if File.exist?( filepath )
                
                #upload new picture
                upload_io = params[:book][:picture]
                filename = @book.id.to_s + '.' + upload_io.original_filename.to_s.split('.')[-1]
                filepath = Rails.root.join('app', 'assets', 'images', 'upload_books', filename)
                File.open(filepath, 'wb') do | file |
                    file.write(upload_io.read)
                end
                @book.picture = filename
                @book.save
            end
        
            redirect_to controller: 'admin', action: 'books_index'
        else
            render :book_edit
        end
    end
    
    def book_new
        @book = Book.new
    end
    
    def book_create
        @book = Book.new(book_params)
        if @book.save
            upload_io = params[:book][:picture]
            filename = @book.id.to_s + '.' + upload_io.original_filename.to_s.split('.')[-1]
            filepath = Rails.root.join('app', 'assets', 'images', 'upload_books', filename)
            File.open(filepath, 'wb') do | file |
                file.write(upload_io.read)
            end
            @book.picture = filename
            @book.save

            redirect_to controller: 'admin', action: 'books_index'
        else
            render :book_new
        end
    end
    
    # management announcement
    def announcement_index
        @announcement = Announcement.all.order('created_at DESC')
    end
    
    def announcement_edit
        @announcement = Announcement.find(params[:id])
        if( params[:commit] == 'delete' )
            @announcement.destroy
            redirect_to controller: 'admin', action: 'announcement_index'
        elsif( params[:commit] == 'email' )
            users = User.all
            users.each do | row |
                if row.email_yn == 1
                    UserMailer.notify_announcement(row, @announcement).deliver
                end
            end
            redirect_to controller: 'admin', action: 'announcement_index'
        end
    end
    
    def announcement_update
        @announcement = Announcement.find( params[:announcement][:id] )
        if @announcement.update(announcement_params)
            redirect_to controller: 'admin', action: 'announcement_index'
        else
            render :announcement_edit
        end
    end
    
    def announcement_new
        @announcement = Announcement.new
    end
    
    def announcement_create
        @announcement = Announcement.new(announcement_params)
        if @announcement.save
            redirect_to controller: 'admin', action: 'announcement_index'
        else
            render :announcement_new
        end
    end
    
    #management order
    def order_index
        order = Order.all.order('updated_at DESC')

        @order_list = []
        order.each do | row |
            jrow = row.as_json # => hash
            
            #query book detail
            jbook_detail = row.book.as_json
            
            #query user detail
            juser_detail = row.user.as_json
            
            # hash.reverse_merge( hash )
            jrow.reverse_merge!( jbook_detail )
            jrow.reverse_merge!( juser_detail )

            @order_list.append( jrow )
        end
    end
    
    def order_edit
        @order = Order.find( params[:id] )
        if params[:commit] == "update pay-amount"
            @order.pay += order_params["change_pay"].to_i
            @order.save
        elsif params[:commit] == "delete"
            @order.delete_yn = 1
            @order.save
        elsif params[:commit] == "ok"
            @order.affect = 1
            @order.save
        end
        
        redirect_to controller: 'admin', action: 'order_index'
    end
    
    private
    
    def user_params
        if( !params[:user][:password].blank? )
            params[:user][:password] = Digest::MD5.hexdigest(params[:user][:password] + 'book_ordering')
            params.require(:user).permit(:password, :privilege)
        else
            params.require(:user).permit(:privilege)
        end
    end
    
    def book_params
        params.require(:book).permit(:bookname, :isbn, :coursename, :price, :price_single, :price_team, :team_limit, :booking_deadline, :state, :price_booking, :comment, :pay_deadline)
    end
    
    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end
    
    def order_params
        params.permit(:change_pay)
    end
end
