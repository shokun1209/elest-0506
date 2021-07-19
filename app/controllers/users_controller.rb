class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    unless user_signed_in? && current_user.id == @user.id
      redirect_to root_path
    end
    @topics = @user.topics.order('created_at DESC')
    @notifications = current_user.passive_notifications.includes(:visitor) #ユーザが受け取る通知の全て
    @notifications.where(checked: false).each do |notification| #indexページを開いた瞬間に通知のcheckedは全てtrueに変える
      notification.update(checked: true)
    end
  end
end
