class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.article = @article
    @comment.user = current_user if current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'articles/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit
    @article = @comment.article
  end

  def update
    @article = @comment.article
    @comment.update_attributes(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    @article = @comment.article
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to article_path(@article) }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
