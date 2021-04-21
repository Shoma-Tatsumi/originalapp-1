class Recruitment < ApplicationRecord
  belongs_to :user

  validate :event_date_cannot_be_in_the_past
  validate :start_end_time

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :event_date
    validates :start_time
    validates :end_time
    validates :place
    validates :number_of_people, numericality: { only_integer: true, message: 'is only half-width number' }
    validates :description
    validates :prefecture_id
  end
  validates :category_id, numericality: { other_than: 0, message: 'Select' }

  def event_date_cannot_be_in_the_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, "can't select a date in the past")
    end
  end

  def start_end_time
    if start_time.present? && end_time.present? && start_time > end_time
      errors.add(:end_time, "can't select a time later than the start time")
    end
  end
end
