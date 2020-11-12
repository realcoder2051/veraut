require 'rails_helper'

RSpec.describe "task_items/index", type: :view do
  before(:each) do
    assign(:task_items, [
      TaskItem.create!(
        task: nil,
        company_contact: "Company Contact",
        company_data: "Company Data",
        principals: "Principals",
        family_relationship: "Family Relationship",
        other_companies_owned: "Other Companies Owned",
        contacts: "Contacts",
        plan_compilance_question: "Plan Compilance Question",
        other_compilance_question: "Other Compilance Question",
        employee_census: "Employee Census",
        final_approval: false
      ),
      TaskItem.create!(
        task: nil,
        company_contact: "Company Contact",
        company_data: "Company Data",
        principals: "Principals",
        family_relationship: "Family Relationship",
        other_companies_owned: "Other Companies Owned",
        contacts: "Contacts",
        plan_compilance_question: "Plan Compilance Question",
        other_compilance_question: "Other Compilance Question",
        employee_census: "Employee Census",
        final_approval: false
      )
    ])
  end

  it "renders a list of task_items" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Company Contact".to_s, count: 2
    assert_select "tr>td", text: "Company Data".to_s, count: 2
    assert_select "tr>td", text: "Principals".to_s, count: 2
    assert_select "tr>td", text: "Family Relationship".to_s, count: 2
    assert_select "tr>td", text: "Other Companies Owned".to_s, count: 2
    assert_select "tr>td", text: "Contacts".to_s, count: 2
    assert_select "tr>td", text: "Plan Compilance Question".to_s, count: 2
    assert_select "tr>td", text: "Other Compilance Question".to_s, count: 2
    assert_select "tr>td", text: "Employee Census".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
