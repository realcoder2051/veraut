require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        address1: "Address1",
        address2: "Address2",
        city: "City",
        state: "State",
        zip: "Zip",
        address_type: "Address Type",
        general: nil
      ),
      Address.create!(
        address1: "Address1",
        address2: "Address2",
        city: "City",
        state: "State",
        zip: "Zip",
        address_type: "Address Type",
        general: nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: "Address1".to_s, count: 2
    assert_select "tr>td", text: "Address2".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: "Zip".to_s, count: 2
    assert_select "tr>td", text: "Address Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
