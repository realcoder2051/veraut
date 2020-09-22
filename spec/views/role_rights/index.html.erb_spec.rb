require 'rails_helper'

RSpec.describe "role_rights/index", type: :view do
  before(:each) do
    assign(:role_rights, [
      RoleRight.create!(
        assign_role: "Assign Role",
        role: nil,
        right: nil
      ),
      RoleRight.create!(
        assign_role: "Assign Role",
        role: nil,
        right: nil
      )
    ])
  end

  it "renders a list of role_rights" do
    render
    assert_select "tr>td", text: "Assign Role".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
