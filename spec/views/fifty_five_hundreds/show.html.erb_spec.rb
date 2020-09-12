require 'rails_helper'

RSpec.describe "fifty_five_hundreds/show", type: :view do
  before(:each) do
    @fifty_five_hundred = assign(:fifty_five_hundred, FiftyFiveHundred.create!(
      question1: "Question1",
      question2: "Question2",
      question3: "",
      question4: "Question4",
      question5: "Question5",
      question6: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Question1/)
    expect(rendered).to match(/Question2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Question4/)
    expect(rendered).to match(/Question5/)
    expect(rendered).to match(//)
  end
end
