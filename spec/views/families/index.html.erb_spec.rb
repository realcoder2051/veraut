require 'rails_helper'

RSpec.describe "families/index", type: :view do
  before(:each) do
    assign(:families, [
      Family.create!(
        name: "Name",
        relationship: "Relationship",
        related_to: "Related To"
      ),
      Family.create!(
        name: "Name",
        relationship: "Relationship",
        related_to: "Related To"
      )
    ])
  end

  it "renders a list of families" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Relationship".to_s, count: 2
    assert_select "tr>td", text: "Related To".to_s, count: 2
  end
end
