require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Compensation/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Pre Tax Salary Deferal/)
    expect(rendered).to match(/Roth Salary Deferal/)
    expect(rendered).to match(/Employee Match/)
    expect(rendered).to match(/Company Division/)
    expect(rendered).to match(/false/)
  end
end
