require 'rails_helper'

RSpec.describe "generals/show", type: :view do
  before(:each) do
    @general = assign(:general, General.create!(
      address_type: "Address Type",
      address: "Address",
      contact_type: "Contact Type",
      number: "Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address Type/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Contact Type/)
    expect(rendered).to match(/Number/)
  end
end
