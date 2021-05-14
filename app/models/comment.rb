class Comment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :type
  belongs_to :user
  belongs_to :topic

  with_options presence: true do
    validates :comment, length: { maximum: 1000 }
    validates :type_id, numericality: { other_than: 1 }
  end
end
