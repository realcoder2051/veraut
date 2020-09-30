require 'rails_helper'

RSpec.describe "task_groups/show", type: :view do
  before(:each) do
    @task_group = assign(:task_group, TaskGroup.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
