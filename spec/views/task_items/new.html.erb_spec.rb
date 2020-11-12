require 'rails_helper'

RSpec.describe "task_items/new", type: :view do
  before(:each) do
    assign(:task_item, TaskItem.new(
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

  it "renders new task_item form" do
    render

    assert_select "form[action=?][method=?]", task_items_path, "post" do

      assert_select "input[name=?]", "task_item[task_id]"

      assert_select "input[name=?]", "task_item[company_contact]"

      assert_select "input[name=?]", "task_item[company_data]"

      assert_select "input[name=?]", "task_item[principals]"

      assert_select "input[name=?]", "task_item[family_relationship]"

      assert_select "input[name=?]", "task_item[other_companies_owned]"

      assert_select "input[name=?]", "task_item[contacts]"

      assert_select "input[name=?]", "task_item[plan_compilance_question]"

      assert_select "input[name=?]", "task_item[other_compilance_question]"

      assert_select "input[name=?]", "task_item[employee_census]"

      assert_select "input[name=?]", "task_item[final_approval]"
    end
  end
end
