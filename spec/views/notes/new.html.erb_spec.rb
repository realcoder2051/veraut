require 'rails_helper'

RSpec.describe "notes/new", type: :view do
  before(:each) do
    assign(:note, Note.new(
      description: "MyString",
      data_collection_step: "MyString",
      created_by: "MyString"
    ))
  end

  it "renders new note form" do
    render

    assert_select "form[action=?][method=?]", notes_path, "post" do

      assert_select "input[name=?]", "note[description]"

      assert_select "input[name=?]", "note[data_collection_step]"

      assert_select "input[name=?]", "note[created_by]"
    end
  end
end
