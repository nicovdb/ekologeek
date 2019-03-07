class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
    @topic = Topic.find(params[:topic_id])
    @answer = Answer.new(answer_params)
    @answer.topic = @topic
    @answer.user = current_user if current_user
    if @answer.save
      respond_to do |format|
        format.html { redirect_to topic_path(@topic) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'topics/show' }
        format.js
      end
    end
  end

  def edit
    @topic = @answer.topic
  end

  def update
    @topic = @answer.topic
    @answer.update_attributes(answer_params)
    if @answer.save
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic = @answer.topic
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to topic_path(@topic) }
      format.js
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
