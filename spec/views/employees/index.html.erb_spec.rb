require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        ssn: 2,
        gender: "Gender",
        compensation: "Compensation",
        hours: 3,
        pre_tax_salary_deferal: "Pre Tax Salary Deferal",
        roth_salary_deferal: "Roth Salary Deferal",
        employee_match: "Employee Match",
        company_division: "Company Division",
        union_employee: false
      ),
      Employee.create!(
        first_name: "First Name",
        last_name: "Last Name",
        ssn: 2,
        gender: "Gender",
        compensation: "Compensation",
        hours: 3,
        pre_tax_salary_deferal: "Pre Tax Salary Deferal",
        roth_salary_deferal: "Roth Salary Deferal",
        employee_match: "Employee Match",
        company_division: "Company Division",
        union_employee: false
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Gender".to_s, count: 2
    assert_select "tr>td", text: "Compensation".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Pre Tax Salary Deferal".to_s, count: 2
    assert_select "tr>td", text: "Roth Salary Deferal".to_s, count: 2
    assert_select "tr>td", text: "Employee Match".to_s, count: 2
    assert_select "tr>td", text: "Company Division".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
