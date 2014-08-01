class ArticlesController < ApplicationController

	before_action :authenticate_user! 

	before_filter :validate_owner, :only => [:show,:destroy,:edit]

	def new	
		@article= Article.new
	end

	def create
  		@article = Article.new(article_params)
  		@article.user = current_user
  		if @article.save
    		redirect_to @article
  		else
  			render 'new'
 		end
	end 

	def update
	  	if @article.update(article_params)
	    	redirect_to @article
	  	else
	    	render 'edit'
  		end
	end

	def destroy
  		@article.destroy
 
  		redirect_to articles_path
	end
 
	def index
		if current_user
			@articles = Article.where( user_id: current_user.id)
		else
			redirect_to root_path
		end		
	end

 
private
  	def article_params
    	params.require(:article).permit(:title, :text)
  	end
  	def validate_owner
  		@article = Article.find(params[:id])
  		redirect_to new_user_session_path unless @article.user == current_user
  	end
end
