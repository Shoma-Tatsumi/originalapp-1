class YearsOfExperience < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '初心者' },
    { id: 2, name: '3年未満' },
    { id: 3, name: '3年以上6年未満' },
    { id: 4, name: '6年以上10年未満' },
    { id: 5, name: '10年以上' }
  ]

  include ActiveHash::Associations
  has_many :users
end