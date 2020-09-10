require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      name: "Name",
      company_name: "Company Name",
      email: "Email",
      roles: "Roles",
      rights: "Rights"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Roles/)
    expect(rendered).to match(/Rights/)
  end
end
