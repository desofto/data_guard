FactoryBot.define do
  factory :group do
    event
    leader { create(:user) }
  end
end
