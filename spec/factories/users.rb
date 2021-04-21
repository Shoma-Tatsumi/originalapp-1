# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { Faker::Internet.free_email }
    password               { 'test01' }
    password_confirmation  { password }
    age                    { 26 }
    years_of_experience_id { 1 }
    introduction           { 'Dynamite' }
  end
end
