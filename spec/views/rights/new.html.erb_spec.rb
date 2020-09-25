require 'rails_helper'

RSpec.describe "rights/new", type: :view do
  before(:each) do
    assign(:right, Right.new(
      right_type: "MyString",
      role: nil
    ))
  end

  it "renders new right form" do
    render

    assert_select "form[action=?][method=?]", rights_path, "post" do

      assert_select "input[name=?]", "right[right_type]"

      assert_select "input[name=?]", "right[role_id]"
    end
  end
end
