require 'rails_helper'

RSpec.describe "feduciary_documents/index", type: :view do
  before(:each) do
    assign(:feduciary_documents, [
      FeduciaryDocument.create!(
        plan: "Plan",
        type: "Type",
        description: "Description",
        taskgroup: nil
      ),
      FeduciaryDocument.create!(
        plan: "Plan",
        type: "Type",
        description: "Description",
        taskgroup: nil
      )
    ])
  end

  it "renders a list of feduciary_documents" do
    render
    assert_select "tr>td", text: "Plan".to_s, count: 2
    assert_select "tr>td", text: "Type".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
