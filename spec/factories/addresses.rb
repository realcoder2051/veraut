FactoryBot.define do
  factory :address do
    address1 { "MyString" }
    address2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    address_type { "MyString" }
    general { nil }
  end
end
