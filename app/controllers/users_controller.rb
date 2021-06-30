class UsersController < ApplicationController

  def new
    @user = User.new
    @user.image.build
  end
  def show
    @user = User.find(params[:id])
    @topic = Topic.find(params[:id])
  end

  def edit
  end
end
