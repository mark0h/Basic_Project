class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		# render plain: params[:article].inspect #This will display what was sent when created
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render 'new'  #Renders the new page agein /articles/new
		end
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def show	
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article was successfully deleted"
		redirect_to articles_path
	end

	private
	  def set_article
	  	@article = Article.find(params[:id])
	  end

	  def article_params
	  	params.require(:article).permit(:title, :description)  #Allows these values to go through to the table. Prevents editing of protected fields(like id)
	  end
end