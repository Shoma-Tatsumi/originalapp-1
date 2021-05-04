# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :recruitment
  belongs_to :user

  validates :text, presence: true
end
