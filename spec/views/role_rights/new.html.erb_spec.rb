require 'rails_helper'

RSpec.describe "role_rights/new", type: :view do
  before(:each) do
    assign(:role_right, RoleRight.new(
      assign_role: "MyString",
      role: nil,
      right: nil
    ))
  end

  it "renders new role_right form" do
    render

    assert_select "form[action=?][method=?]", role_rights_path, "post" do

      assert_select "input[name=?]", "role_right[assign_role]"

      assert_select "input[name=?]", "role_right[role_id]"

      assert_select "input[name=?]", "role_right[right_id]"
    end
  end
end
