class BadsController < ApplicationController
  before_action :set_topic

  def create
    @bad = Bad.new(user_id: current_user.id, topic_id: params[:topic_id])
    @bad.save
    redirect_to topic_path(@topic.id)
  end

  def destroy
    Bad.find_by(user_id: current_user.id, topic_id: params[:topic_id]).destroy
    redirect_to topic_path(@topic.id)
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
