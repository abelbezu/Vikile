class AdminController < ApplicationController
	layout "main"

	before_action :confirm_admin, :except => [:login]
	before_action :confirm_super_admin, :only => [:create_admin]

	def index

	end

	def articles
	end 

	def accounts
	end 

	def stats
	end 

	def login

	end

	def create_admin

	end 

	def stats_redirects
	end 

	def stats_users
	end 

	def stats_articles
	end 

	def images
	end

end
