require 'rails_helper'

RSpec.describe "contact_change_requests/show", type: :view do
  before(:each) do
    @contact_change_request = assign(:contact_change_request, ContactChangeRequest.create!(
      created_by: "Created By",
      change_request: "Change Request"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Created By/)
    expect(rendered).to match(/Change Request/)
  end
end
