require 'rails_helper'

RSpec.describe "principals/show", type: :view do
  before(:each) do
    @principal = assign(:principal, Principal.create!(
      name: "Name",
      title: "Title",
      officer: false,
      ownership: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
