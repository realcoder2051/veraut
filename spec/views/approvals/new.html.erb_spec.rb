require 'rails_helper'

RSpec.describe "approvals/new", type: :view do
  before(:each) do
    assign(:approval, Approval.new(
      status: false,
      user: nil
    ))
  end

  it "renders new approval form" do
    render

    assert_select "form[action=?][method=?]", approvals_path, "post" do

      assert_select "input[name=?]", "approval[status]"

      assert_select "input[name=?]", "approval[user_id]"
    end
  end
end
