class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
  layout "article"

  def index
    @tags = ActsAsTaggableOn::Tag.all.map { |tag| tag.name }

    if params[:tag].present?
      if current_user && current_user.admin?
        @articles = Article.tagged_with(params[:tag])
        @pagy, @articles = pagy( @articles, items: 10)
      else
        @articles = Article.tagged_with(params[:tag]).published
        @pagy, @articles = pagy( @articles, items: 10)
      end
    else
      if current_user && current_user.admin?
        @articles = Article.all
        @pagy, @articles = pagy( @articles, items: 10)
      else
        @articles = Article.published
        @pagy, @articles = pagy( @articles, items: 10)
      end
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.project = current_user.company.project
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @comments = @article.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    @article.update_attributes(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def publish
    @article.update(published: true)
    redirect_to article_path(@article)
  end

  def unpublish
    @article.update(published: false)
    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:author, :title, :subtitle, :cover, :cover_cache, :content, :visibility, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
