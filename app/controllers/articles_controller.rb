class ArticlesController < ApplicationController

  before_action :find_article, only: [:update, :destroy, :edit]
  before_action :check_permission, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.order :created_at => :desc
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    redirect_to articles_path
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def check_permission
    unless Ability.new(current_user).can? :manage, Article
      render 'errors/403', :status => 403
    end
  end

end
