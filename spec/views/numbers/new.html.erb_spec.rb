require 'rails_helper'

RSpec.describe "numbers/new", type: :view do
  before(:each) do
    assign(:number, Number.new(
      number: "MyString",
      contact_type: "MyString",
      general: nil
    ))
  end

  it "renders new number form" do
    render

    assert_select "form[action=?][method=?]", numbers_path, "post" do

      assert_select "input[name=?]", "number[number]"

      assert_select "input[name=?]", "number[contact_type]"

      assert_select "input[name=?]", "number[general_id]"
    end
  end
end
