class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # By default this renders the new article view
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # Recall: Redirect to makes a new request
      redirect_to @article
    else # If the user missed something
      render :new, status: :unprocessable_entity
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
