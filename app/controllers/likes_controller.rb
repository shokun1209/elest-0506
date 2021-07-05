class LikesController < ApplicationController
  before_action :set_topic
  before_action :set_comments

  def create
    @like = Like.create(user_id: current_user.id, topic_id: params[:topic_id])
    if @like.save
    redirect_to topic_path(@topic.id)
    else
      render "topics/show"
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    if @like.destroy
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
end
