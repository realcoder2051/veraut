require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      name: "MyString",
      company_name: "MyString",
      email: "MyString",
      roles: "MyString",
      rights: "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[company_name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[roles]"

      assert_select "input[name=?]", "contact[rights]"
    end
  end
end
