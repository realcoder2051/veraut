require 'rails_helper'

RSpec.describe "buisenesses/edit", type: :view do
  before(:each) do
    @buiseness = assign(:buiseness, Buiseness.create!(
      name: "MyString",
      ein: 1,
      address: "MyString",
      city: "MyString",
      state: "MyString",
      zip: "MyString",
      phone: "MyString",
      does_company_have_employees: false,
      qualified_plan_sponsored: "MyString",
      entity_type: "MyString"
    ))
  end

  it "renders the edit buiseness form" do
    render

    assert_select "form[action=?][method=?]", buiseness_path(@buiseness), "post" do

      assert_select "input[name=?]", "buiseness[name]"

      assert_select "input[name=?]", "buiseness[ein]"

      assert_select "input[name=?]", "buiseness[address]"

      assert_select "input[name=?]", "buiseness[city]"

      assert_select "input[name=?]", "buiseness[state]"

      assert_select "input[name=?]", "buiseness[zip]"

      assert_select "input[name=?]", "buiseness[phone]"

      assert_select "input[name=?]", "buiseness[does_company_have_employees]"

      assert_select "input[name=?]", "buiseness[qualified_plan_sponsored]"

      assert_select "input[name=?]", "buiseness[entity_type]"
    end
  end
end
