FactoryBot.define do
  factory :comment do
    text { "テストコメント" }
    association :user
    association :recruitment
  end
end
