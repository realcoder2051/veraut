FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    ssn { 1 }
    gender { "MyString" }
    date_of_birth { "2020-09-11" }
    original_date_of_hire { "2020-09-11" }
    date_of_termination { "2020-09-11" }
    date_of_retire { "2020-09-11" }
    compensation { "MyString" }
    hours { 1 }
    pre_tax_salary_deferal { "MyString" }
    roth_salary_deferal { "MyString" }
    employee_match { "MyString" }
    company_division { "MyString" }
    union_employee { false }
  end
end
