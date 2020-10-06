require 'rails_helper'

RSpec.describe "questionaire_answers/edit", type: :view do
  before(:each) do
    @questionaire_answer = assign(:questionaire_answer, QuestionaireAnswer.create!(
      question: "MyString",
      references: "",
      references: ""
    ))
  end

  it "renders the edit questionaire_answer form" do
    render

    assert_select "form[action=?][method=?]", questionaire_answer_path(@questionaire_answer), "post" do

      assert_select "input[name=?]", "questionaire_answer[question]"

      assert_select "input[name=?]", "questionaire_answer[references]"

      assert_select "input[name=?]", "questionaire_answer[references]"
    end
  end
end
