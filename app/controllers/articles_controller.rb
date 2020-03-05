class ArticlesController < ApplicationController

	before_action :set_articles_id, only: [:edit, :update, :show, :destroy]
	before_action :auth, only: [:create]

	def index
		# byebug
		@article = Article.all
		# @article = Article.paginate(page: params[:page], per_page: 3)
	end

	def new
		@article = Article.new
	end

	def create
		
		@article = Article.new(article_params)
		@article.user = current_user
		
		if @article.save
			flash[:success] = "Article was created successfully!!!"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
		# set_articles_id
	end

	def edit
		# set_articles_id
	end

	def update
		# set_articles_id
		if @article.update(article_params)
			flash[:success] = "Article was updated successfully!!!"
			redirect_to article_path
		else
			flash[:notice] = "Article was not updated . . ."
			render 'edit'
		end
	end

	def destroy
		# set_articles_id
		@article.destroy
		flash[:notice] = "Article was deleted"
		redirect_to articles_path	
	end

	private 

	def auth
		if not current_user
			flash[:notice] = "Must be login first"
			redirect_to login_path	
		end
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_articles_id
		@article = Article.find(params[:id])
	end
end