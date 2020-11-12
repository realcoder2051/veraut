require 'rails_helper'

RSpec.describe "project_templates/edit", type: :view do
  before(:each) do
    @project_template = assign(:project_template, ProjectTemplate.create!(
      project_name: "MyString"
    ))
  end

  it "renders the edit project_template form" do
    render

    assert_select "form[action=?][method=?]", project_template_path(@project_template), "post" do

      assert_select "input[name=?]", "project_template[project_name]"
    end
  end
end
