require 'rails_helper'

RSpec.describe "task_items/show", type: :view do
  before(:each) do
    @task_item = assign(:task_item, TaskItem.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Company Contact/)
    expect(rendered).to match(/Company Data/)
    expect(rendered).to match(/Principals/)
    expect(rendered).to match(/Family Relationship/)
    expect(rendered).to match(/Other Companies Owned/)
    expect(rendered).to match(/Contacts/)
    expect(rendered).to match(/Plan Compilance Question/)
    expect(rendered).to match(/Other Compilance Question/)
    expect(rendered).to match(/Employee Census/)
    expect(rendered).to match(/false/)
  end
end
