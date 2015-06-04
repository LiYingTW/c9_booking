class LoginController < ApplicationController
    skip_before_action :authenticate
    
    def login
        #if cookies[:account].blank?
        if session[:account].blank?
            @user = User.new
        else
            redirect_to controller: "order", action: "index"
        end
    end
    
    def auth
        account = params[:user][:account]
        password = Digest::MD5.hexdigest( params[:user][:password] + 'book_ordering')
        row = User.where( ["account = ? and password = ?", account, password ] )
        if !row.empty? and row.size == 1 and row[0].account == account and row[0].password == password
            #cookies.signed[:account] = { :value => row[0].account, :expires => 1.minutes.from_now }
            #cookies.signed[:account] = { :value => row[0].account, :expires => 1.minutes.from_now }
            #cookies.signed[:name] = { :value => row[0].name, :expires => 1.minutes.from_now }
            session[:account] = row[0].account
            session[:name] = row[0].name
            redirect_to controller: "order", action: "index"
        else
            render :error
        end
    end
    
    def logout
        reset_session
        redirect_to controller: "login", action: "login"
    end
end
