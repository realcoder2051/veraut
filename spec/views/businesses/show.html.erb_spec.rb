require 'rails_helper'

RSpec.describe "businesses/show", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      name: "Name",
      ein: 2,
      address: "Address",
      city: "City",
      state: "State",
      zip: "Zip",
      phone: "Phone",
      does_company_have_employees: false,
      qualified_plan_sponsored: "Qualified Plan Sponsored",
      entity_type: "Entity Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Qualified Plan Sponsored/)
    expect(rendered).to match(/Entity Type/)
  end
end
