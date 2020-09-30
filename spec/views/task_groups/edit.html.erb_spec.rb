require 'rails_helper'

RSpec.describe "task_groups/edit", type: :view do
  before(:each) do
    @task_group = assign(:task_group, TaskGroup.create!())
  end

  it "renders the edit task_group form" do
    render

    assert_select "form[action=?][method=?]", task_group_path(@task_group), "post" do
    end
  end
end
