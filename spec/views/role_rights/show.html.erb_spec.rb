require 'rails_helper'

RSpec.describe "role_rights/show", type: :view do
  before(:each) do
    @role_right = assign(:role_right, RoleRight.create!(
      assign_role: "Assign Role",
      role: nil,
      right: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Assign Role/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
