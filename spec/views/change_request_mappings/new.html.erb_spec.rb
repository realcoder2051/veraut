require 'rails_helper'

RSpec.describe "change_request_mappings/new", type: :view do
  before(:each) do
    assign(:change_request_mapping, ChangeRequestMapping.new(
      user_id: 1,
      task_id: 1,
      is_requested: "MyString",
      role_change_id: 1
    ))
  end

  it "renders new change_request_mapping form" do
    render

    assert_select "form[action=?][method=?]", change_request_mappings_path, "post" do

      assert_select "input[name=?]", "change_request_mapping[user_id]"

      assert_select "input[name=?]", "change_request_mapping[task_id]"

      assert_select "input[name=?]", "change_request_mapping[is_requested]"

      assert_select "input[name=?]", "change_request_mapping[role_change_id]"
    end
  end
end
