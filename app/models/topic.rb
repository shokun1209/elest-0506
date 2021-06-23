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

  with_options presence: true do
    validates :title, length: { maximum: 20 }
    validates :text, length: { maximum: 300 }
    validates :category_id, numericality: { other_than: 1 }
  end
  validates :images, length:{ maximum: 4 }
end
