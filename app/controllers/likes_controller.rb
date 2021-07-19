class LikesController < ApplicationController
  before_action :set_topic
  before_action :set_comments
  before_action :set_validates

  def create
    @like = Like.create(user_id: current_user.id, topic_id: params[:topic_id])
    if !current_user.hated_by?(@topic) && current_user.id != @topic.user_id
      @like.save
      @topic.create_notification_like(current_user)
      redirect_to topic_path(@topic.id)
    else
      render "topics/show"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if current_user.liked_by?(@topic) && current_user.id != @topic.user_id
      @like.destroy
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
