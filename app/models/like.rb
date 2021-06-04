class Like < ApplicationRecord
  belongs_to :recruitment
  belongs_to :user

  validates_uniquness_of :recruitment_id, scope: :user_id
end
