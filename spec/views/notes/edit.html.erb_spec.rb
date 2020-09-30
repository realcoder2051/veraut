require 'rails_helper'

RSpec.describe "notes/edit", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      description: "MyString",
      data_collection_step: "MyString",
      created_by: "MyString"
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input[name=?]", "note[description]"

      assert_select "input[name=?]", "note[data_collection_step]"

      assert_select "input[name=?]", "note[created_by]"
    end
  end
end
