require 'rails_helper'

RSpec.describe "numbers/edit", type: :view do
  before(:each) do
    @number = assign(:number, Number.create!(
      number: "MyString",
      contact_type: "MyString",
      general: nil
    ))
  end

  it "renders the edit number form" do
    render

    assert_select "form[action=?][method=?]", number_path(@number), "post" do

      assert_select "input[name=?]", "number[number]"

      assert_select "input[name=?]", "number[contact_type]"

      assert_select "input[name=?]", "number[general_id]"
    end
  end
end
