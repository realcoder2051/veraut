require 'rails_helper'

RSpec.describe "fifty_five_hundreds/edit", type: :view do
  before(:each) do
    @fifty_five_hundred = assign(:fifty_five_hundred, FiftyFiveHundred.create!(
      question1: "MyString",
      question2: "MyString",
      question3: "",
      question4: "MyString",
      question5: "MyString",
      question6: ""
    ))
  end

  it "renders the edit fifty_five_hundred form" do
    render

    assert_select "form[action=?][method=?]", fifty_five_hundred_path(@fifty_five_hundred), "post" do

      assert_select "input[name=?]", "fifty_five_hundred[question1]"

      assert_select "input[name=?]", "fifty_five_hundred[question2]"

      assert_select "input[name=?]", "fifty_five_hundred[question3]"

      assert_select "input[name=?]", "fifty_five_hundred[question4]"

      assert_select "input[name=?]", "fifty_five_hundred[question5]"

      assert_select "input[name=?]", "fifty_five_hundred[question6]"
    end
  end
end
