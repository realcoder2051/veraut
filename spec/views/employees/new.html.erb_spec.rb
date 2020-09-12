require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      first_name: "MyString",
      last_name: "MyString",
      ssn: 1,
      gender: "MyString",
      compensation: "MyString",
      hours: 1,
      pre_tax_salary_deferal: "MyString",
      roth_salary_deferal: "MyString",
      employee_match: "MyString",
      company_division: "MyString",
      union_employee: false
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do

      assert_select "input[name=?]", "employee[first_name]"

      assert_select "input[name=?]", "employee[last_name]"

      assert_select "input[name=?]", "employee[ssn]"

      assert_select "input[name=?]", "employee[gender]"

      assert_select "input[name=?]", "employee[compensation]"

      assert_select "input[name=?]", "employee[hours]"

      assert_select "input[name=?]", "employee[pre_tax_salary_deferal]"

      assert_select "input[name=?]", "employee[roth_salary_deferal]"

      assert_select "input[name=?]", "employee[employee_match]"

      assert_select "input[name=?]", "employee[company_division]"

      assert_select "input[name=?]", "employee[union_employee]"
    end
  end
end
