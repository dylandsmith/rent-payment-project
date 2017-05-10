require 'rails_helper'

RSpec.describe "property_owners/show", type: :view do
  before(:each) do
    @property_owner = assign(:property_owner, PropertyOwner.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :owner_address => "Owner Address",
      :owner_phone => "Owner Phone",
      :number_of_properties => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Owner Address/)
    expect(rendered).to match(/Owner Phone/)
    expect(rendered).to match(/2/)
  end
end
