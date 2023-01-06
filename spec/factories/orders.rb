FactoryBot.define do
  factory :order do
    quantity { 1 }
    user { nil }
    stock { nil }
  end
end
