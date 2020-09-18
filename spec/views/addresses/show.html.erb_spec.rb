require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      address1: "Address1",
      address2: "Address2",
      city: "City",
      state: "State",
      zip: "Zip",
      address_type: "Address Type",
      general: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address1/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Address Type/)
    expect(rendered).to match(//)
  end
end
