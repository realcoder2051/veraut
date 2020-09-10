require 'rails_helper'

RSpec.describe "plans/new", type: :view do
  before(:each) do
    assign(:plan, Plan.new(
      question1: "MyString",
      question2: "MyString",
      question3: "MyString",
      question4: "MyString",
      question5: "MyString",
      question6: "MyString",
      question7: "MyString",
      question8: "MyString",
      question9: "MyString",
      question10: "MyString",
      question11: "MyString",
      question12: "MyString"
    ))
  end

  it "renders new plan form" do
    render

    assert_select "form[action=?][method=?]", plans_path, "post" do

      assert_select "input[name=?]", "plan[question1]"

      assert_select "input[name=?]", "plan[question2]"

      assert_select "input[name=?]", "plan[question3]"

      assert_select "input[name=?]", "plan[question4]"

      assert_select "input[name=?]", "plan[question5]"

      assert_select "input[name=?]", "plan[question6]"

      assert_select "input[name=?]", "plan[question7]"

      assert_select "input[name=?]", "plan[question8]"

      assert_select "input[name=?]", "plan[question9]"

      assert_select "input[name=?]", "plan[question10]"

      assert_select "input[name=?]", "plan[question11]"

      assert_select "input[name=?]", "plan[question12]"
    end
  end
end
