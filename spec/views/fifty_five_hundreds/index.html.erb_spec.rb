require 'rails_helper'

RSpec.describe "fifty_five_hundreds/index", type: :view do
  before(:each) do
    assign(:fifty_five_hundreds, [
      FiftyFiveHundred.create!(
        question1: "Question1",
        question2: "Question2",
        question3: "",
        question4: "Question4",
        question5: "Question5",
        question6: ""
      ),
      FiftyFiveHundred.create!(
        question1: "Question1",
        question2: "Question2",
        question3: "",
        question4: "Question4",
        question5: "Question5",
        question6: ""
      )
    ])
  end

  it "renders a list of fifty_five_hundreds" do
    render
    assert_select "tr>td", text: "Question1".to_s, count: 2
    assert_select "tr>td", text: "Question2".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Question4".to_s, count: 2
    assert_select "tr>td", text: "Question5".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
