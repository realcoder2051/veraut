require 'rails_helper'

RSpec.describe "buisenesses/index", type: :view do
  before(:each) do
    assign(:buisenesses, [
      Buiseness.create!(
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
      ),
      Buiseness.create!(
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
      )
    ])
  end

  it "renders a list of buisenesses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: "Zip".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Qualified Plan Sponsored".to_s, count: 2
    assert_select "tr>td", text: "Entity Type".to_s, count: 2
  end
end
