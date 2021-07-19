module NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @visitor_comment = notification.comment_id
    # @title = Topic.title(params[id: notification.topic_id])
    case notification.action
    when 'like'
      id = notification.topic_id
      @topic = Topic.find_by(id: id)
      tag.a("#{@topic.title}", href: topic_path(notification.topic_id), class:"tag") + ' がGoodされました'
    when 'comment' then
      @comment = Comment.find_by(id: @visitor_comment)
      @micropost_title = @comment.topic.title
      tag.a("#{@micropost_title}", href: topic_path(notification.topic_id), class:"tag") + ' に新着コメントがあります'
    end
  end
end

