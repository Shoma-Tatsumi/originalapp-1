require "date"

FactoryBot.define do
  factory :recruitment do
    event_date { '2050-01-01' }
    start_time { '06:00' }
    end_time   { '18:00' }
    place      { 'テストフットサル場' }
    number_of_people { 10 }
    category_id { 1 }
    description { 'test' }
    prefecture_id { 25 }
    association :user
  end
end
