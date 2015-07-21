class SessionsController < ApplicationController
  def create
    authorized_user = Account.from_omniauth(env["omniauth.auth"])
    
    session[:logged_in] = true
	session[:user_id] = authorized_user.id
	session[:email] = authorized_user.email
	session[:name] = authorized_user.display_name
	
	session[:picture] = authorized_user.image.url
	flash[:notice] = "You are now logged in."
	redirect_to(session[:return_to] ||= request.referer)

  end

  def destroy
    session[:user_id] = nil
    session[:logged_in] = false
    redirect_to root_url
  end
end