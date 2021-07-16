class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  before_action :set_attention
  before_action :set_validates, only: [:new, :create, :destroy]

  def index
    @topics = Topic.all.order('created_at DESC').includes(:user)
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
    @comments = @topic.comments.includes(:user)
  end

  def destroy
    if current_user.id == @topic.user_id
      @topic.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def arena
    @topics = Topic.where(category_id:2).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def gran
    @topics = Topic.where(category_id:3).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def event
    @topics = Topic.where(category_id:4).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def gacha
    @topics = Topic.where(category_id:5).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def doxing
    @topics = Topic.where(category_id:6).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def team
    @topics = Topic.where(category_id:7).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def other
    @topics = Topic.where(category_id:8).order('created_at DESC').includes(:user)
    render action: "index"
  end

  def search_self
    @topics = Topic.search(params[:keyword]).includes(:user)
    render action: "index"
  end

  # def comment
  #   @topics = Topic.joins(:comments).includes(:comments).order("comments.created_at DESC")
  #   render action: "index"
  # end


  private

  def topic_params
    params.require(:topic).permit(:title, :text, :category_id, :user_id,{images: []},:anonymous).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def set_attention
    @attention = Topic.joins(:comments).order("comments.created_at DESC").limit(2).includes(:user)
  end

  def set_validates
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
