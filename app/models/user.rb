class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         generate_public_uid
         mount_uploader :image, ImageUploader
         has_many :topics
         has_many :comments

         with_options presence: true do
          validates :nickname
         end
end
