class CommentsController < ApplicationController
  before_action :set_topic, only: [:create,:destroy]

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to topic_path(params[:topic_id])
    else
      render "topics/show"
    end
  end

  def destroy
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def comment_params
    params.require(:comment).permit(:comment,:type_id,:anonymous,{images: []}).merge(topic_id: params[:topic_id],user_id: current_user.id)
  end
end
