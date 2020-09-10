require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        company_name: "Company Name",
        ein: "Ein",
        entity_tye: "Entity Tye",
        naic_code: "Naic Code",
        payroll_provider: "Payroll Provider",
        payroll_frequency: "Payroll Frequency"
      ),
      Company.create!(
        company_name: "Company Name",
        ein: "Ein",
        entity_tye: "Entity Tye",
        naic_code: "Naic Code",
        payroll_provider: "Payroll Provider",
        payroll_frequency: "Payroll Frequency"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Ein".to_s, count: 2
    assert_select "tr>td", text: "Entity Tye".to_s, count: 2
    assert_select "tr>td", text: "Naic Code".to_s, count: 2
    assert_select "tr>td", text: "Payroll Provider".to_s, count: 2
    assert_select "tr>td", text: "Payroll Frequency".to_s, count: 2
  end
end
