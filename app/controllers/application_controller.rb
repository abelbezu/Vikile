class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   private
	def confirm_logged_in
		unless session[:user_id]
			flash[:notice] = "Please log in."
			redirect_to(:controller => 'access', :action => "login")
			return false
		else 
			return true
		end
	end 

	def confirm_admin
		unless Account.find(session[:user_id]).privilage == 'admin' or Account.find(session[:user_id]).privilage == 'super'
			flash[:notice] = "Please log in."
			redirect_to(:controller => 'admin', :action => "login")
			return false
		else 
			return true
		end
	end 

	def confirm_super_admin
		unless Account.find(session[:user_id]).privilage == 'super'
			flash[:notice] = "Please log in."
			
			return false
		else 
			return true
		end
	end 

	def partial_copy(main_hash_input, list_of_fields)
		return_hash = Hash.new
		list_of_fields.each do |x|
			return_hash[x] = main_hash_input[x]
		end
		return_hash

	end
	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user
end
