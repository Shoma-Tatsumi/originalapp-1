class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '誰でも歓迎' },
    { id: 2, name: '初級(経験年数：3~6年)' },
    { id: 3, name: '中級(経験年数：6~10年)' },
    { id: 4, name: '上級(経験年数：10年以上)' },
  ]

  include ActiveHash::Associations
  has_many :items
end