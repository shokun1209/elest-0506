class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
  belongs_to :user
  belongs_to :topic
  has_many :notifications, dependent: :destroy

  with_options presence: true do
    validates :comment, length: { maximum: 300 }
    validates :type_id, numericality: { other_than: 1 }
  end
end
