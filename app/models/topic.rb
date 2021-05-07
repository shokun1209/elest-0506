class Topic < ApplicationRecord
  mount_uploaders :topic_image, ImageUploader
  belongs_to :user
end
