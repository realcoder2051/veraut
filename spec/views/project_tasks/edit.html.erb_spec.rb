require 'rails_helper'

RSpec.describe "project_tasks/edit", type: :view do
  before(:each) do
    @project_task = assign(:project_task, ProjectTask.create!(
      task: nil,
      company_contact: "MyString",
      company_data: "MyString",
      principals: "MyString",
      family_relationship: "MyString",
      other_companies_owned: "MyString",
      contacts: "MyString",
      plan_compilance_question: "MyString",
      other_compilance_question: "MyString",
      employee_census: "MyString",
      final_approval: false
    ))
  end

  it "renders the edit project_task form" do
    render

    assert_select "form[action=?][method=?]", project_task_path(@project_task), "post" do

      assert_select "input[name=?]", "project_task[task_id]"

      assert_select "input[name=?]", "project_task[company_contact]"

      assert_select "input[name=?]", "project_task[company_data]"

      assert_select "input[name=?]", "project_task[principals]"

      assert_select "input[name=?]", "project_task[family_relationship]"

      assert_select "input[name=?]", "project_task[other_companies_owned]"

      assert_select "input[name=?]", "project_task[contacts]"

      assert_select "input[name=?]", "project_task[plan_compilance_question]"

      assert_select "input[name=?]", "project_task[other_compilance_question]"

      assert_select "input[name=?]", "project_task[employee_census]"

      assert_select "input[name=?]", "project_task[final_approval]"
    end
  end
end
