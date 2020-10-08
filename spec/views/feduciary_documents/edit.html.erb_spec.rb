require 'rails_helper'

RSpec.describe "feduciary_documents/edit", type: :view do
  before(:each) do
    @feduciary_document = assign(:feduciary_document, FeduciaryDocument.create!(
      plan: "MyString",
      type: "",
      description: "MyString",
      taskgroup: nil
    ))
  end

  it "renders the edit feduciary_document form" do
    render

    assert_select "form[action=?][method=?]", feduciary_document_path(@feduciary_document), "post" do

      assert_select "input[name=?]", "feduciary_document[plan]"

      assert_select "input[name=?]", "feduciary_document[type]"

      assert_select "input[name=?]", "feduciary_document[description]"

      assert_select "input[name=?]", "feduciary_document[taskgroup_id]"
    end
  end
end
