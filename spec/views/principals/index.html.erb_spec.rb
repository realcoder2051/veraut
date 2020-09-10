require 'rails_helper'

RSpec.describe "principals/index", type: :view do
  before(:each) do
    assign(:principals, [
      Principal.create!(
        name: "Name",
        title: "Title",
        officer: false,
        ownership: ""
      ),
      Principal.create!(
        name: "Name",
        title: "Title",
        officer: false,
        ownership: ""
      )
    ])
  end

  it "renders a list of principals" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
