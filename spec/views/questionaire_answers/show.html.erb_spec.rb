require 'rails_helper'

RSpec.describe "questionaire_answers/show", type: :view do
  before(:each) do
    @questionaire_answer = assign(:questionaire_answer, QuestionaireAnswer.create!(
      question: "Question",
      references: "",
      references: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
