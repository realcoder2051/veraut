require 'rails_helper'

RSpec.describe "generals/new", type: :view do
  before(:each) do
    assign(:general, General.new(
      address_type: "MyString",
      address: "MyString",
      contact_type: "MyString",
      number: "MyString"
    ))
  end

  it "renders new general form" do
    render

    assert_select "form[action=?][method=?]", generals_path, "post" do

      assert_select "input[name=?]", "general[address_type]"

      assert_select "input[name=?]", "general[address]"

      assert_select "input[name=?]", "general[contact_type]"

      assert_select "input[name=?]", "general[number]"
    end
  end
end
