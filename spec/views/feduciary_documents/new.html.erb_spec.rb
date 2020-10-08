require 'rails_helper'

RSpec.describe "feduciary_documents/new", type: :view do
  before(:each) do
    assign(:feduciary_document, FeduciaryDocument.new(
      plan: "MyString",
      type: "",
      description: "MyString",
      taskgroup: nil
    ))
  end

  it "renders new feduciary_document form" do
    render

    assert_select "form[action=?][method=?]", feduciary_documents_path, "post" do

      assert_select "input[name=?]", "feduciary_document[plan]"

      assert_select "input[name=?]", "feduciary_document[type]"

      assert_select "input[name=?]", "feduciary_document[description]"

      assert_select "input[name=?]", "feduciary_document[taskgroup_id]"
    end
  end
end
