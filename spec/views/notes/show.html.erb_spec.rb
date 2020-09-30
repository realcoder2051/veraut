require 'rails_helper'

RSpec.describe "notes/show", type: :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      description: "Description",
      data_collection_step: "Data Collection Step",
      created_by: "Created By"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Data Collection Step/)
    expect(rendered).to match(/Created By/)
  end
end
