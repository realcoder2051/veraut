require 'rails_helper'

RSpec.describe "principals/edit", type: :view do
  before(:each) do
    @principal = assign(:principal, Principal.create!(
      name: "MyString",
      title: "MyString",
      officer: false,
      ownership: ""
    ))
  end

  it "renders the edit principal form" do
    render

    assert_select "form[action=?][method=?]", principal_path(@principal), "post" do

      assert_select "input[name=?]", "principal[name]"

      assert_select "input[name=?]", "principal[title]"

      assert_select "input[name=?]", "principal[officer]"

      assert_select "input[name=?]", "principal[ownership]"
    end
  end
end
