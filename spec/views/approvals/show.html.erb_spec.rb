require 'rails_helper'

RSpec.describe "approvals/show", type: :view do
  before(:each) do
    @approval = assign(:approval, Approval.create!(
      status: false,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
