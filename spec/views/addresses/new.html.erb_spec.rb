require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      address1: "MyString",
      address2: "MyString",
      city: "MyString",
      state: "MyString",
      zip: "MyString",
      address_type: "MyString",
      general: nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

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
