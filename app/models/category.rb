class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アリーナ' },
    { id: 3, name: 'グランバトル' },
    { id: 4, name: 'イベント' },
    { id: 5, name: 'ガチャ' },
    { id: 6, name: '晒し' },
    { id: 7, name: 'チーム募集' },
    { id: 8, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :topics
end