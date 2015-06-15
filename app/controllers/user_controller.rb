class UserController < ApplicationController
    skip_before_action :authenticate, :except => [ :profile, :update_profile, :update_password ]
    
    def new
        @user = User.new
    end
    
    def create
        if params[:user][:password] == params[:user][:password_confirm]
            @user = User.new(user_params)
            @user.privilege = 1 #classmate
            if @user.save
                redirect_to controller: 'login', action: 'login'
            else
                render :new
            end
        else
            @user = User.new(user_params)
            render :new
        end
    end
    
    def profile
    end
    
    def update_profile
        if @user.update(update_profile_user_params)
            redirect_to controller: 'order', action: 'index'
        else
            render :profile
        end
    end
    
    def update_password
        if Digest::MD5.hexdigest( params[:old_password] + 'book_ordering' ) == @user.password and params[:user][:password] == params[:user][:password_confirm]
            @user.update( update_password_user_params )
            redirect_to controller: 'order', action: 'index'
        else
            render :profile
        end
    end
    
    private
    def user_params
        params[:user][:password] = Digest::MD5.hexdigest( params[:user][:password] + 'book_ordering' )
        params.require(:user).permit(:account, :password, :name, :email, :email_yn, :cell_phone)
    end
    
    def update_profile_user_params
        params.require(:user).permit(:name, :email, :email_yn, :cell_phone)
    end
    
    def update_password_user_params
        params[:user][:password] = Digest::MD5.hexdigest( params[:user][:password] + 'book_ordering' )
        params.require(:user).permit(:password)
    end
end
