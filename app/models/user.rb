class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         generate_public_uid
         mount_uploader :image, ImageUploader
         has_many :topics, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_topics, through: :likes, source: :topic
         has_many :active_notifications, class_name: "Notification", foreign_key:"visitor_id", dependent: :destroy
        has_many :passive_notifications, class_name: "Notification", foreign_key:"visited_id", dependent: :destroy
         def liked_by?(topic_id)
          likes.where(topic_id: topic_id).exists?
        end
        has_many :bads, dependent: :destroy
        has_many :baded_topics, through: :likes, source: :topic
        def hated_by?(topic_id)
         bads.where(topic_id: topic_id).exists?
       end
         with_options presence: true do
          validates :nickname
        end
end
