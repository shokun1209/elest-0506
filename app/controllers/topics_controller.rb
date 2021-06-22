class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  def index
    @topics = Topic.all.order('created_at DESC')
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
    @comment = Comment.new
    @comments = @topic.comments
  end

  def destroy
    if @topic.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :text, :category_id, :user_id,{images: []},:anonymous).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
