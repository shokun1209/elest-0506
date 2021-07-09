class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @topics = current_user.topics.order('created_at DESC')
  end

  def edit
  end
end
