class CommentsController < ApplicationController
  before_action :set_topic, only: [:create,:destroy]
  before_action :set_validates, only: [:create, :destroy]


  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      @topic.create_notification_comment(current_user,@comment.id)
      redirect_to topic_path(params[:topic_id])
    else
      @comments = @topic.comments.includes(:user)
      render "topics/show"
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id],topic_id: params[:topic_id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to topic_path(@topic.id)
    else
      render "topics/show"
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def comment_params
    params.require(:comment).permit(:comment,:type_id,:anonymous,{images: []}).merge(topic_id: params[:topic_id],user_id: current_user.id)
  end

  def set_validates
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
