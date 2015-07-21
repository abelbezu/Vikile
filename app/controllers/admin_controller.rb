class AdminController < ApplicationController
	layout "admin"

	#before_action :confirm_admin, :except => [:login]
	#before_action :confirm_super_admin, :only => [:create_admin]

	def index
		
	end

	def articles
		
	end 

	def accounts
		
	end 

	def stats
		
	end 

	def version_diff
		@article = Article.find(params[:id])
	end 

	
	def create_admin
		@account = Account.new(account_params)
  	if @account.save
      
      session[:logged_in] = true
      session[:user_id] = @account.id
      session[:email] = account_params[:email]
      session[:name] = account_params[:display_name]

      session[:picture] = @account.picture
  	  redirect_to(:action =>'index')
      
  	
  	else 
  		render('index')
  	end
		
	end 

	def admin_edit
		@article = Article.find(params[:id])
		
	end

	def stats_redirects
		
	end 

	def stats_users
		
	end 

	def stats_articles
		
	end 

	def images
		
	end

	private 
	  def account_params
	  	params.require(:account).permit(:first_name, :last_name, :nick_name, :email, :password, :privilage)
	  end


end
