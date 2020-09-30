require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        task_name: "Task Name",
        references: ""
      ),
      Task.create!(
        task_name: "Task Name",
        references: ""
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", text: "Task Name".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
