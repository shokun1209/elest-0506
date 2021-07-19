class NotificationsController < ApplicationController

  def destroy
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to user_path
  end
end
