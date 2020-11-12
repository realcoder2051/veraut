require 'rails_helper'

RSpec.describe "project_templates/show", type: :view do
  before(:each) do
    @project_template = assign(:project_template, ProjectTemplate.create!(
      project_name: "Project Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Project Name/)
  end
end
