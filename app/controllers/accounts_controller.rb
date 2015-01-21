class AccountsController < ApplicationController
	layout 'application'
  #before_action :confirm_logged_in, :except => [:index]
  def index
    render('index')
  end


  

  def create
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
  def signup
  end

  def edit
    #liks to the edit page (view)
  end

  def delete
  #if the need to delete a user account ever arizes, this will link to the delete page
  end

  private 
  def account_params
  	params.require(:account).permit(:first_name, :last_name, :nick_name, :email, :password)
  end
end
