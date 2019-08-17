FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    full_name { 'John Smith' }

    unit
  end
end
