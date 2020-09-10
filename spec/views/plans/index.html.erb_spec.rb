require 'rails_helper'

RSpec.describe "plans/index", type: :view do
  before(:each) do
    assign(:plans, [
      Plan.create!(
        question1: "Question1",
        question2: "Question2",
        question3: "Question3",
        question4: "Question4",
        question5: "Question5",
        question6: "Question6",
        question7: "Question7",
        question8: "Question8",
        question9: "Question9",
        question10: "Question10",
        question11: "Question11",
        question12: "Question12"
      ),
      Plan.create!(
        question1: "Question1",
        question2: "Question2",
        question3: "Question3",
        question4: "Question4",
        question5: "Question5",
        question6: "Question6",
        question7: "Question7",
        question8: "Question8",
        question9: "Question9",
        question10: "Question10",
        question11: "Question11",
        question12: "Question12"
      )
    ])
  end

  it "renders a list of plans" do
    render
    assert_select "tr>td", text: "Question1".to_s, count: 2
    assert_select "tr>td", text: "Question2".to_s, count: 2
    assert_select "tr>td", text: "Question3".to_s, count: 2
    assert_select "tr>td", text: "Question4".to_s, count: 2
    assert_select "tr>td", text: "Question5".to_s, count: 2
    assert_select "tr>td", text: "Question6".to_s, count: 2
    assert_select "tr>td", text: "Question7".to_s, count: 2
    assert_select "tr>td", text: "Question8".to_s, count: 2
    assert_select "tr>td", text: "Question9".to_s, count: 2
    assert_select "tr>td", text: "Question10".to_s, count: 2
    assert_select "tr>td", text: "Question11".to_s, count: 2
    assert_select "tr>td", text: "Question12".to_s, count: 2
  end
end
