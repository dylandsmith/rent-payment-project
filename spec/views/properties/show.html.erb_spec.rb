require 'rails_helper'

RSpec.describe "properties/show", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :property_title => "Property Title",
      :address => "Address",
      :number_of_units => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Property Title/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2/)
  end
end
