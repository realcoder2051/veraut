require 'rails_helper'

RSpec.describe "principals/new", type: :view do
  before(:each) do
    assign(:principal, Principal.new(
      name: "MyString",
      title: "MyString",
      officer: false,
      ownership: ""
    ))
  end

  it "renders new principal form" do
    render

    assert_select "form[action=?][method=?]", principals_path, "post" do

      assert_select "input[name=?]", "principal[name]"

      assert_select "input[name=?]", "principal[title]"

      assert_select "input[name=?]", "principal[officer]"

      assert_select "input[name=?]", "principal[ownership]"
    end
  end
end
