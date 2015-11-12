class ArticlesController < ApplicationController

  def index
    @articles = Article.order :created_at => :desc
  end

  def new
  end

  def create
    article_params = params[:article]
    article_params.permit!
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

end
