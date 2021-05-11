class TopicsController < ApplicationController
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
    @topic = Topic.find(params[:id])
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :text, :category_id, :user_id,{images: []},:anonymous).merge(user_id: current_user.id)
  end

end
