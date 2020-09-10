require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      name: "MyString",
      company_name: "MyString",
      email: "MyString",
      roles: "MyString",
      rights: "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[company_name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[roles]"

      assert_select "input[name=?]", "contact[rights]"
    end
  end
end
