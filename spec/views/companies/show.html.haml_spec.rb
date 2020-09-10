require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      company_name: "Company Name",
      ein: "Ein",
      entity_tye: "Entity Tye",
      naic_code: "Naic Code",
      payroll_provider: "Payroll Provider",
      payroll_frequency: "Payroll Frequency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Ein/)
    expect(rendered).to match(/Entity Tye/)
    expect(rendered).to match(/Naic Code/)
    expect(rendered).to match(/Payroll Provider/)
    expect(rendered).to match(/Payroll Frequency/)
  end
end
