class Comment < ApplicationRecord
  belongs_to :recruitment
  belongs_to :user
end
