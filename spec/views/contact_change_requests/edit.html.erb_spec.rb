require 'rails_helper'

RSpec.describe "contact_change_requests/edit", type: :view do
  before(:each) do
    @contact_change_request = assign(:contact_change_request, ContactChangeRequest.create!(
      created_by: "MyString",
      change_request: "MyString"
    ))
  end

  it "renders the edit contact_change_request form" do
    render

    assert_select "form[action=?][method=?]", contact_change_request_path(@contact_change_request), "post" do

      assert_select "input[name=?]", "contact_change_request[created_by]"

      assert_select "input[name=?]", "contact_change_request[change_request]"
    end
  end
end
