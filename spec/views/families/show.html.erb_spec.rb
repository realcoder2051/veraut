require 'rails_helper'

RSpec.describe "families/show", type: :view do
  before(:each) do
    @family = assign(:family, Family.create!(
      name: "Name",
      relationship: "Relationship",
      related_to: "Related To"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Relationship/)
    expect(rendered).to match(/Related To/)
  end
end
