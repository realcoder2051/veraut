require 'rails_helper'

RSpec.describe "rights/show", type: :view do
  before(:each) do
    @right = assign(:right, Right.create!(
      right_type: "Right Type",
      role: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Right Type/)
    expect(rendered).to match(//)
  end
end
