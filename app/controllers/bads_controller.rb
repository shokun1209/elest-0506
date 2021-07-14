class BadsController < ApplicationController
  before_action :set_topic
  before_action :set_comments
  before_action :set_validates

  def create
    @bad = Bad.create(user_id: current_user.id, topic_id: params[:topic_id])
    if !current_user.liked_by?(@topic) && current_user.id != @topic.user_id
      @bad.save
      redirect_to topic_path(@topic.id)
    else
      render "topics/show"
    end
  end

  def destroy
    @bad = Bad.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if current_user.hated_by?(@topic) && current_user.id != @topic.user_id
      @bad.destroy
      redirect_to topic_path(@topic.id)
    else
      render "topics/show"
    end
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_comments
    @comments = @topic.comments
  end

  def set_validates
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
