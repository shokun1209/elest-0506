class LikesController < ApplicationController
  before_action :set_topic

  def create
    @like = Like.new(user_id: current_user.id, topic_id: params[:topic_id])
    if @like.save
      redirect_to topic_path(@topic.id)
    end
  end

  def destroy
    Like.find_by(user_id: current_user.id, topic_id: params[:topic_id]).destroy
    redirect_to topic_path(@topic.id)
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
