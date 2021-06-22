class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         generate_public_uid
         mount_uploader :image, ImageUploader
         has_many :topics
         has_many :comments
         has_many :likes, dependent: :destroy
         has_many :liked_topics, through: :likes, source: :topic
         def liked_by?(topic_id)
          likes.where(topic_id: topic_id).exists?
        end
         with_options presence: true do
          validates :nickname
        end
end
