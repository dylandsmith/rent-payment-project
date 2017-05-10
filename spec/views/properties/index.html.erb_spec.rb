require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        :property_title => "Property Title",
        :address => "Address",
        :number_of_units => 2
      ),
      Property.create!(
        :property_title => "Property Title",
        :address => "Address",
        :number_of_units => 2
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", :text => "Property Title".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
