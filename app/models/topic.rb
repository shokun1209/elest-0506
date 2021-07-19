class Topic < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :bads, dependent: :destroy
  has_many :baded_users, through: :likes, source: :user
  has_many :notifications, dependent: :destroy
  
  with_options presence: true do
    validates :title, length: { maximum: 20 }
    validates :text, length: { maximum: 300 }
    validates :category_id, numericality: { other_than: 1 }
  end
  validates :images, length:{ maximum: 4 }
  validate :image_length
  
  
  
  def self.search(search)
    if search != ""
      Topic.where('title LIKE(?)', "%#{search}%")
    else
      Topic.all
    end
  end
  
  def create_notification_like(current_user)
    notification = current_user.active_notifications.new(
      comment_id: nil,
      topic_id: id,
      visited_id: user_id,
      action: 'like'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
  def create_notification_comment(current_user, comment_id)
    temp_ids = Comment.where(topic_id: id).select(:user_id).where.not("user_id = ? or user_id = ?", current_user.id, user_id).distinct 
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment(current_user, comment_id, user_id)
  end
  
  def save_notification_comment(current_user, comment_id, visited_id)#(通知をした人,通知されたコメント,通知された人)
    notification = current_user.active_notifications.new(
      topic_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  
  private
  def image_length
    if images.length >= 4
      errors.add(:images, "は3枚以内にしてください")
    end
  end
end
