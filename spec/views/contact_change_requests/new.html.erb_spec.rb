require 'rails_helper'

RSpec.describe "contact_change_requests/new", type: :view do
  before(:each) do
    assign(:contact_change_request, ContactChangeRequest.new(
      created_by: "MyString",
      change_request: "MyString"
    ))
  end

  it "renders new contact_change_request form" do
    render

    assert_select "form[action=?][method=?]", contact_change_requests_path, "post" do

      assert_select "input[name=?]", "contact_change_request[created_by]"

      assert_select "input[name=?]", "contact_change_request[change_request]"
    end
  end
end
