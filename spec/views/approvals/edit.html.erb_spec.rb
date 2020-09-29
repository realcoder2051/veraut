require 'rails_helper'

RSpec.describe "approvals/edit", type: :view do
  before(:each) do
    @approval = assign(:approval, Approval.create!(
      status: false,
      user: nil
    ))
  end

  it "renders the edit approval form" do
    render

    assert_select "form[action=?][method=?]", approval_path(@approval), "post" do

      assert_select "input[name=?]", "approval[status]"

      assert_select "input[name=?]", "approval[user_id]"
    end
  end
end
