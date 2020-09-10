require 'rails_helper'

RSpec.describe "businesses/edit", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
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

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input[name=?]", "business[name]"

      assert_select "input[name=?]", "business[ein]"

      assert_select "input[name=?]", "business[address]"

      assert_select "input[name=?]", "business[city]"

      assert_select "input[name=?]", "business[state]"

      assert_select "input[name=?]", "business[zip]"

      assert_select "input[name=?]", "business[phone]"

      assert_select "input[name=?]", "business[does_company_have_employees]"

      assert_select "input[name=?]", "business[qualified_plan_sponsored]"

      assert_select "input[name=?]", "business[entity_type]"
    end
  end
end
