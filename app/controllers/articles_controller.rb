class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

  layout :layout_by_resource

  def layout_by_resource
    if user_signed_in?
      'article'
    else
      'home'
    end
  end

  def index
    tag
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

  def tag
    @tags = []

    if params[:tag].present?
      if current_user && current_user.admin?
        @articles = Article.all.tagged_with(params[:tag]).order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      elsif current_user
        @articles = Article.visibles.tagged_with(params[:tag]).order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      else
        @articles = Article.visibles_ext.tagged_with(params[:tag]).order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      end
    else
      if current_user && current_user.admin?
        @articles = Article.all.order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      elsif current_user
        @articles = Article.visibles.order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      else
        @articles = Article.visibles_ext.order(publish_date: :desc)
        @pagy, @articles = pagy( @articles, items: 9)
      end
    end

    @articles.each do |article|
      article.tag_list.each { |tag| @tags << tag }
    end

  end

  def article_params
    params.require(:article).permit(:author, :title, :subtitle, :cover, :cover_cache, :content, :visibility, :tag_list, :publish_date)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
