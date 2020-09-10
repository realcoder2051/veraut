FactoryBot.define do
  factory :business do
    name { "MyString" }
    ein { 1 }
    date_purchased_or_sold { "2020-09-10" }
    address { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    phone { "MyString" }
    does_company_have_employees { false }
    qualified_plan_sponsored { "MyString" }
    entity_type { "MyString" }
  end
end
