FactoryBot.define do
  factory :project_task do
    task { nil }
    company_contact { "MyString" }
    company_data { "MyString" }
    principals { "MyString" }
    family_relationship { "MyString" }
    other_companies_owned { "MyString" }
    contacts { "MyString" }
    plan_compilance_question { "MyString" }
    other_compilance_question { "MyString" }
    employee_census { "MyString" }
    final_approval { false }
  end
end
