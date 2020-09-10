require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      company_name: "MyString",
      ein: "MyString",
      entity_tye: "MyString",
      naic_code: "MyString",
      payroll_provider: "MyString",
      payroll_frequency: "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[company_name]"

      assert_select "input[name=?]", "company[ein]"

      assert_select "input[name=?]", "company[entity_tye]"

      assert_select "input[name=?]", "company[naic_code]"

      assert_select "input[name=?]", "company[payroll_provider]"

      assert_select "input[name=?]", "company[payroll_frequency]"
    end
  end
end
