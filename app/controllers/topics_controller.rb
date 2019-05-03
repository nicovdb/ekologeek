class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  layout "article"

  def index
    @topics = Topic.all.order(:created_at).reverse
    @pagy, @topics = pagy_array( @topics, items: 9)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    @topic.project = current_user.company.project
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :new
    end
  end

  def show
    @answers = @topic.answers
    @answer = Answer.new
  end

  def edit
  end

  def update
    @topic.update_attributes(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

  private

  def topic_params
    params.require(:topic).permit(:content, :cover, :cover_cache)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
