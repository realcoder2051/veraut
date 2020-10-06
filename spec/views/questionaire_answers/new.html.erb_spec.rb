require 'rails_helper'

RSpec.describe "questionaire_answers/new", type: :view do
  before(:each) do
    assign(:questionaire_answer, QuestionaireAnswer.new(
      question: "MyString",
      references: "",
      references: ""
    ))
  end

  it "renders new questionaire_answer form" do
    render

    assert_select "form[action=?][method=?]", questionaire_answers_path, "post" do

      assert_select "input[name=?]", "questionaire_answer[question]"

      assert_select "input[name=?]", "questionaire_answer[references]"

      assert_select "input[name=?]", "questionaire_answer[references]"
    end
  end
end
