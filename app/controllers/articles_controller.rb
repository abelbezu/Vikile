class ArticlesController < ApplicationController


	layout "header"
	def index
		@article = Article.find(5)

	end
	
	def new

	end
	def show
		@article = Article.new

	end

	def about

	end
	def create
	    @article = Article.new(:account_id => '1', :title => params[:article][:title], :introduction => params[:article][:introduction] )
		
	   

		@tip = @article.parts.build(:part_type => 'tip')
				
		params[:article][:tips].each do |tip|
			@tip.contents.build(:content_body => tip[1][:tip_body])
		end
		
		@warning = @article.parts.build(:part_type => 'warning')
				
		params[:article][:warnings].each do |warning|
			@warning.contents.build(:content_body => warning[1][:warning_body])
		end
		
		@source = @article.parts.build(:part_type => 'source')
				
		params[:article][:sources].each do |source|
			binding.pry
			@source.contents.build(:content_body => source[1][:source_body])
		end

		
		
		params[:article][:parts_attributes].each do |x|
			
			@parts = @article.parts.build(:part_type => params[:article][:part_format], :part_title => x[1][:part_title])
			
			
			x[1][:contents_attributes].each do |y|
				
				@parts.contents.build(:content_body => y[1][:content_body])
			end 
		end 

		if @article.save
  			 			
  			redirect_to(:action => 'index')
  			flash[:notice] = "Debate successfully saved"
  		else 
  			flash[:notice] = "Couldn't create debate, Please try again"
  			redirect_to(:action => 'new')


  		end
	end

	def test
		@article = Article.new
		3.times {@article.parts.build}

	end

	# private 
	# def article_params
	# 	params.require(:article).permit(:account_id, :title, :introduction, :part_format, :tips, :warnings, :sources, parts_attributes: [:part_title, contents_attributes: [:content_body]])
		

	# end
end
