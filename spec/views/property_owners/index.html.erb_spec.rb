require 'rails_helper'

RSpec.describe "property_owners/index", type: :view do
  before(:each) do
    assign(:property_owners, [
      PropertyOwner.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :owner_address => "Owner Address",
        :owner_phone => "Owner Phone",
        :number_of_properties => 2
      ),
      PropertyOwner.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :owner_address => "Owner Address",
        :owner_phone => "Owner Phone",
        :number_of_properties => 2
      )
    ])
  end

  it "renders a list of property_owners" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Address".to_s, :count => 2
    assert_select "tr>td", :text => "Owner Phone".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
