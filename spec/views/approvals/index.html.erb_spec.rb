require 'rails_helper'

RSpec.describe "approvals/index", type: :view do
  before(:each) do
    assign(:approvals, [
      Approval.create!(
        status: false,
        user: nil
      ),
      Approval.create!(
        status: false,
        user: nil
      )
    ])
  end

  it "renders a list of approvals" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
