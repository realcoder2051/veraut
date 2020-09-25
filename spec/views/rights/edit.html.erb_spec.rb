require 'rails_helper'

RSpec.describe "rights/edit", type: :view do
  before(:each) do
    @right = assign(:right, Right.create!(
      right_type: "MyString",
      role: nil
    ))
  end

  it "renders the edit right form" do
    render

    assert_select "form[action=?][method=?]", right_path(@right), "post" do

      assert_select "input[name=?]", "right[right_type]"

      assert_select "input[name=?]", "right[role_id]"
    end
  end
end
