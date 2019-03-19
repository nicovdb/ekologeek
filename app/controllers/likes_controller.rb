class LikesController < ApplicationController

  def create
    @like = Like.new(article_id: params[:article_id])
    @like.user = current_user
    if @like.save
      respond_to do |format|
        format.html { redirect_to article_path(@like.article) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render article_path(@like.article) }
        format.js
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @article = @like.article
    if @like.destroy
      respond_to do |format|
        format.html { redirect_to article_path(@article) }
        format.js
      end
    end
  end

end
