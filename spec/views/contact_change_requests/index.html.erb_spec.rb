require 'rails_helper'

RSpec.describe "contact_change_requests/index", type: :view do
  before(:each) do
    assign(:contact_change_requests, [
      ContactChangeRequest.create!(
        created_by: "Created By",
        change_request: "Change Request"
      ),
      ContactChangeRequest.create!(
        created_by: "Created By",
        change_request: "Change Request"
      )
    ])
  end

  it "renders a list of contact_change_requests" do
    render
    assert_select "tr>td", text: "Created By".to_s, count: 2
    assert_select "tr>td", text: "Change Request".to_s, count: 2
  end
end
