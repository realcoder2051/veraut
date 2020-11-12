require 'rails_helper'

RSpec.describe "project_templates/index", type: :view do
  before(:each) do
    assign(:project_templates, [
      ProjectTemplate.create!(
        project_name: "Project Name"
      ),
      ProjectTemplate.create!(
        project_name: "Project Name"
      )
    ])
  end

  it "renders a list of project_templates" do
    render
    assert_select "tr>td", text: "Project Name".to_s, count: 2
  end
end
