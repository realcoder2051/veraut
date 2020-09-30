require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        description: "Description",
        data_collection_step: "Data Collection Step",
        created_by: "Created By"
      ),
      Note.create!(
        description: "Description",
        data_collection_step: "Data Collection Step",
        created_by: "Created By"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Data Collection Step".to_s, count: 2
    assert_select "tr>td", text: "Created By".to_s, count: 2
  end
end
