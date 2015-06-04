class OrderController < ApplicationController
    def index
        @announcement = Announcement.all.order("updated_at DESC")
        books = Book.all.where("state = 1")
        #@user = User.where("account = ?", session[:account])[0]
        
        @book_order = []
        books.each do | book |
            #query booking detail
            row = @user.order.where("book_id = ? and delete_yn = 0", book.id)
            jbook =  book.as_json # => hash
            if !row.empty?
                row = row[0].as_json # => hash
                # hash.reverse_merge( hash )
                @book_order.append(row.as_json.reverse_merge(jbook.as_json))
            else
                @book_order.append(jbook)
            end
        end
    end
    
    def order
        if params[:commit] == 'order'
            print 'order'
            row = @user.order.build( order_params )
            row.pay = 0
            row.affect = 0
            row.delete_yn = 0
            row.number = 1
            row.save
        elsif params[:commit] == 'unorder'
            print 'unorder'
            row = @user.order.where( unorder_params )[0]
            row.delete_yn = 1
            row.save
        end
        
        redirect_to controller: 'order', action: 'index'
    end
    
    
    private
    
    def order_params
        params.permit(:book_id)
    end
    
    def unorder_params
        params.permit(:book_id, :id)
    end
end
