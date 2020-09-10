require 'rails_helper'

RSpec.describe "families/edit", type: :view do
  before(:each) do
    @family = assign(:family, Family.create!(
      name: "MyString",
      relationship: "MyString",
      related_to: "MyString"
    ))
  end

  it "renders the edit family form" do
    render

    assert_select "form[action=?][method=?]", family_path(@family), "post" do

      assert_select "input[name=?]", "family[name]"

      assert_select "input[name=?]", "family[relationship]"

      assert_select "input[name=?]", "family[related_to]"
    end
  end
end
