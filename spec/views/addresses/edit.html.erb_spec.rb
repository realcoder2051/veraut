require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      address1: "MyString",
      address2: "MyString",
      city: "MyString",
      state: "MyString",
      zip: "MyString",
      address_type: "MyString",
      general: nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[address1]"

      assert_select "input[name=?]", "address[address2]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[zip]"

      assert_select "input[name=?]", "address[address_type]"

      assert_select "input[name=?]", "address[general_id]"
    end
  end
end
