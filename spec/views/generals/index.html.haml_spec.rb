require 'rails_helper'

RSpec.describe "generals/index", type: :view do
  before(:each) do
    assign(:generals, [
      General.create!(
        address_type: "Address Type",
        address: "Address",
        contact_type: "Contact Type",
        number: "Number"
      ),
      General.create!(
        address_type: "Address Type",
        address: "Address",
        contact_type: "Contact Type",
        number: "Number"
      )
    ])
  end

  it "renders a list of generals" do
    render
    assert_select "tr>td", text: "Address Type".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: "Contact Type".to_s, count: 2
    assert_select "tr>td", text: "Number".to_s, count: 2
  end
end
