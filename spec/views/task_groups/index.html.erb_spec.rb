require 'rails_helper'

RSpec.describe "task_groups/index", type: :view do
  before(:each) do
    assign(:task_groups, [
      TaskGroup.create!(),
      TaskGroup.create!()
    ])
  end

  it "renders a list of task_groups" do
    render
  end
end
