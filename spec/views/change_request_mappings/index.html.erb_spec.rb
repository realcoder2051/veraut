require 'rails_helper'

RSpec.describe "change_request_mappings/index", type: :view do
  before(:each) do
    assign(:change_request_mappings, [
      ChangeRequestMapping.create!(
        user_id: 2,
        task_id: 3,
        is_requested: "Is Requested",
        role_change_id: 4
      ),
      ChangeRequestMapping.create!(
        user_id: 2,
        task_id: 3,
        is_requested: "Is Requested",
        role_change_id: 4
      )
    ])
  end

  it "renders a list of change_request_mappings" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Is Requested".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
