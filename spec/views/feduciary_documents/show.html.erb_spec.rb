require 'rails_helper'

RSpec.describe "feduciary_documents/show", type: :view do
  before(:each) do
    @feduciary_document = assign(:feduciary_document, FeduciaryDocument.create!(
      plan: "Plan",
      type: "Type",
      description: "Description",
      taskgroup: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Plan/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
