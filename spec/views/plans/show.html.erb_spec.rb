require 'rails_helper'

RSpec.describe "plans/show", type: :view do
  before(:each) do
    @plan = assign(:plan, Plan.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question1/)
    expect(rendered).to match(/Question2/)
    expect(rendered).to match(/Question3/)
    expect(rendered).to match(/Question4/)
    expect(rendered).to match(/Question5/)
    expect(rendered).to match(/Question6/)
    expect(rendered).to match(/Question7/)
    expect(rendered).to match(/Question8/)
    expect(rendered).to match(/Question9/)
    expect(rendered).to match(/Question10/)
    expect(rendered).to match(/Question11/)
    expect(rendered).to match(/Question12/)
  end
end
