class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :error_message, :authenticate # note : careful to the order
  
  
  
  
  def authenticate
    if session[:account].blank?
      @is_login = false
      reset_session
      render "login/error"
    else
      @is_login = true
      @user = User.where( "account = ?", session[:account] )[0]
    end
  end
  
  def admin_authenticate
    @is_login = false
    if session[:account].blank?
      reset_session
      render "login/error"
    else
      @is_login = true
      @user = User.where( "account = ?", session[:account] )[0]
      if @user.privilege != 0
        render "auth_error"
      end
    end
  end
  
  def error_message
    @error_message = []
  end
end
