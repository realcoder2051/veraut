require 'rails_helper'

RSpec.describe "numbers/index", type: :view do
  before(:each) do
    assign(:numbers, [
      Number.create!(
        number: "Number",
        contact_type: "Contact Type",
        general: nil
      ),
      Number.create!(
        number: "Number",
        contact_type: "Contact Type",
        general: nil
      )
    ])
  end

  it "renders a list of numbers" do
    render
    assert_select "tr>td", text: "Number".to_s, count: 2
    assert_select "tr>td", text: "Contact Type".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
