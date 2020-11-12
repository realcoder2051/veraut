require 'rails_helper'

RSpec.describe "project_templates/new", type: :view do
  before(:each) do
    assign(:project_template, ProjectTemplate.new(
      project_name: "MyString"
    ))
  end

  it "renders new project_template form" do
    render

    assert_select "form[action=?][method=?]", project_templates_path, "post" do

      assert_select "input[name=?]", "project_template[project_name]"
    end
  end
end
