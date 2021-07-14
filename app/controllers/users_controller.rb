class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.order('created_at DESC')
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
  end

end
