require 'rails_helper'

RSpec.describe "numbers/show", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
      number: "Number",
      contact_type: "Contact Type",
      general: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Contact Type/)
    expect(rendered).to match(//)
  end
end
