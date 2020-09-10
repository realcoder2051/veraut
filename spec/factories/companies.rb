FactoryBot.define do
  factory :company do
    company_name { "MyString" }
    ein { "MyString" }
    fiscal_year_end { "2020-09-10" }
    entity_tye { "MyString" }
    naic_code { "MyString" }
    payroll_provider { "MyString" }
    payroll_frequency { "MyString" }
  end
end
