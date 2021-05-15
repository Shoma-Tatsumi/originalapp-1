# frozen_string_literal: true

class Recruitment < ApplicationRecord
  belongs_to :user

  validate :event_date_cannot_be_in_the_past
  validate :start_end_time

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_many :comments

  with_options presence: true do
    validates :event_date
    validates :start_time
    validates :end_time
    validates :place
    validates :number_of_people, numericality: { only_integer: true, message: 'は半角数字で入力してください' }
    validates :description
    validates :prefecture_id
  end
  validates :category_id, numericality: { other_than: 0, message: 'を選択してください' }

  def event_date_cannot_be_in_the_past
    errors.add(:event_date, "は過去の日付を選択できません") if event_date.present? && event_date < Date.today
  end

  def start_end_time
    if start_time.present? && end_time.present? && start_time > end_time
      errors.add(:end_time, "は開始時刻より遅く選択して下さい")
    end
  end
end
