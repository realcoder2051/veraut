require 'rails_helper'

RSpec.describe "task_groups/new", type: :view do
  before(:each) do
    assign(:task_group, TaskGroup.new())
  end

  it "renders new task_group form" do
    render

    assert_select "form[action=?][method=?]", task_groups_path, "post" do
    end
  end
end
