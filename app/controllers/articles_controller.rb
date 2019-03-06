class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  layout "article"

  def index
    @tags = ActsAsTaggableOn::Tag.all.map { |tag| tag.name }

    if params[:tag].present?
      @articles = Article.tagged_with(params[:tag]).published
    else
      @articles = Article.published
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.project = Project.last
    @article.user = current_user
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

  private

  def article_params
    params.require(:article).permit(:author, :title, :subtitle, :cover, :content, :visibility, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
