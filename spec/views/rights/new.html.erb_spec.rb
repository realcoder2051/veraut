require 'rails_helper'

RSpec.describe "rights/new", type: :view do
  before(:each) do
    assign(:right, Right.new(
      right_type: "MyString"
    ))
  end

  it "renders new right form" do
    render

    assert_select "form[action=?][method=?]", rights_path, "post" do

      assert_select "input[name=?]", "right[right_type]"
    end
  end
end
