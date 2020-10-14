require 'rails_helper'

RSpec.describe "change_request_mappings/show", type: :view do
  before(:each) do
    @change_request_mapping = assign(:change_request_mapping, ChangeRequestMapping.create!(
      user_id: 2,
      task_id: 3,
      is_requested: "Is Requested",
      role_change_id: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Is Requested/)
    expect(rendered).to match(/4/)
  end
end
