require 'rails_helper'

RSpec.describe "change_request_mappings/edit", type: :view do
  before(:each) do
    @change_request_mapping = assign(:change_request_mapping, ChangeRequestMapping.create!(
      user_id: 1,
      task_id: 1,
      is_requested: "MyString",
      role_change_id: 1
    ))
  end

  it "renders the edit change_request_mapping form" do
    render

    assert_select "form[action=?][method=?]", change_request_mapping_path(@change_request_mapping), "post" do

      assert_select "input[name=?]", "change_request_mapping[user_id]"

      assert_select "input[name=?]", "change_request_mapping[task_id]"

      assert_select "input[name=?]", "change_request_mapping[is_requested]"

      assert_select "input[name=?]", "change_request_mapping[role_change_id]"
    end
  end
end
