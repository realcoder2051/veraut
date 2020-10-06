require 'rails_helper'

RSpec.describe "questionaire_answers/index", type: :view do
  before(:each) do
    assign(:questionaire_answers, [
      QuestionaireAnswer.create!(
        question: "Question",
        references: "",
        references: ""
      ),
      QuestionaireAnswer.create!(
        question: "Question",
        references: "",
        references: ""
      )
    ])
  end

  it "renders a list of questionaire_answers" do
    render
    assert_select "tr>td", text: "Question".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
