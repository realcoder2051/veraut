require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        name: "Name",
        company_name: "Company Name",
        email: "Email",
        roles: "Roles",
        rights: "Rights"
      ),
      Contact.create!(
        name: "Name",
        company_name: "Company Name",
        email: "Email",
        roles: "Roles",
        rights: "Rights"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Roles".to_s, count: 2
    assert_select "tr>td", text: "Rights".to_s, count: 2
  end
end
