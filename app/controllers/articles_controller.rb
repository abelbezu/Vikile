class ArticlesController < ApplicationController


	layout "main"
	
	 before_action :authenticate_account!, :except => [:show, :about, :index, :update]
	# before_action :confirm_super_admin, :only => [:edit_admin]

	def index
		@page_title = "Home"
		
	end
	
	def test
		@articles_new = true	

	end



	def show
		if params[:random]
			@article = Article.all(:order => "RANDOM()")
			@page_title = @article.title
			
		elsif params[:id]
			@article = Article.find(params[:id])	
		else
			@article = Article.find(1)
			@page_title = @article.title		
		end

	end


	def edit
		
		if params[:id]
			unless Article.find(params[:id]).is_editable
				@article = Article.find(params[:id]).find_version_to_edit current_account
				redirect_to edit_article_path(@article)
			else
				@article = Article.find(params[:id])
			end
		else
			@article = Article.find(1).create_editable_version_for current_account
			
		end
		

	end
	def exp
		if params[:id]
			@article = Article.find(params[:id]).deep_copy
			
		else
			@article = Article.find(1)
			
		end


		
	end

	def edit_admin
		if params[:id]
			@article = Article.find(params[:id])
			
		else
			@article = Article.find(1)
			
		end

	end

	def new
		@article = Article.new
		@segment = @article.segments.build
		@step = @segment.contents.build		
		
		@tip = @article.tips.build
		tip_content = @tip.contents.build
		@warning = @article.warnings.build
		warning_content = @warning.contents.build
		
	end

	def update
		
		@article = Article.find(article_params[:id])
		if @article.update(article_params)
			redirect_to(:action => "new")
		else 

			redirect_to(:action => "test")
		end
	end


	def search_results

		@search = Article.search do
			fulltext params[:search]
		end

		@articles = @search.results
	end




	def about

	end

	def destroy
		@article_to_delete = Article.find(params[:id])
		if @article_to_delete.destroy
			flash[:notice] = "article destroyed successfully"
			redirect_to(:controller=> 'admin', :action => "articles")
		else
			redirect_to(:controller=> 'admin', :action => "stats_redirects")
		end

	end


	def create		
		@article = Article.new(article_params)
	
		if @article.save				
			redirect_to(:action => "new")
		else 
			redirect_to(:action => "test")
		end	
	end
	

	private 
	def article_params
		params[:article][:account_id] = current_account.id		
		params.require(:article).permit(:id, :account_id,  :title, :category, :status, :segment_type, :segments_attributes => [:id, :position, :title,  :_destroy, contents_attributes: [:id, :position, :content_body, :_destroy, image_attributes: [:id, :picture, :_destroy]]], :tips_attributes => [:id, :tip_position, :_destroy, contents_attributes: [:id, :content_body, :_destroy]], :warnings_attributes => [:id, :warning_position, :_destroy, contents_attributes: [:id, :content_body, :_destroy]] )
		
	end
end
