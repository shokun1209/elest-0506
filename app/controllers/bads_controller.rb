class BadsController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    @bad = Bad.new(user_id: current_user.id, topic_id: params[:topic_id])
    if @bad.save
    redirect_to topic_path(topic.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    topic = Topic.find(params[:topic_id])
    Bad.find_by(user_id: current_user.id, topic_id: params[:topic_id]).destroy
    redirect_to topic_path(topic.id)
  end
end
