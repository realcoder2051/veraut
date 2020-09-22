require 'rails_helper'

RSpec.describe "role_rights/edit", type: :view do
  before(:each) do
    @role_right = assign(:role_right, RoleRight.create!(
      assign_role: "MyString",
      role: nil,
      right: nil
    ))
  end

  it "renders the edit role_right form" do
    render

    assert_select "form[action=?][method=?]", role_right_path(@role_right), "post" do

      assert_select "input[name=?]", "role_right[assign_role]"

      assert_select "input[name=?]", "role_right[role_id]"

      assert_select "input[name=?]", "role_right[right_id]"
    end
  end
end
