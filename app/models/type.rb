class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '肯定派' },
    { id: 3, name: '否定派' }
  ]
  include ActiveHash::Associations
  has_many :comments
end