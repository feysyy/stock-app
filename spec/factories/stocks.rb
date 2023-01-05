FactoryBot.define do
  factory :stock do
    company_name { "MyString" }
    symbol { "MyString" }
    quantity { 1 }
    logo { "MyString" }
    user { nil }
  end
end
