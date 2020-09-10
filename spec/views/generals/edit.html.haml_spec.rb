require 'rails_helper'

RSpec.describe "generals/edit", type: :view do
  before(:each) do
    @general = assign(:general, General.create!(
      address_type: "MyString",
      address: "MyString",
      contact_type: "MyString",
      number: "MyString"
    ))
  end

  it "renders the edit general form" do
    render

    assert_select "form[action=?][method=?]", general_path(@general), "post" do

      assert_select "input[name=?]", "general[address_type]"

      assert_select "input[name=?]", "general[address]"

      assert_select "input[name=?]", "general[contact_type]"

      assert_select "input[name=?]", "general[number]"
    end
  end
end
