FactoryBot.define do
  factory :stock do
    company_name { "APPL" }
    association :user
  end
end
