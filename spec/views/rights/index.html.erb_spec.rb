require 'rails_helper'

RSpec.describe "rights/index", type: :view do
  before(:each) do
    assign(:rights, [
      Right.create!(
        right_type: "Right Type"
      ),
      Right.create!(
        right_type: "Right Type"
      )
    ])
  end

  it "renders a list of rights" do
    render
    assert_select "tr>td", text: "Right Type".to_s, count: 2
  end
end
