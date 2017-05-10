require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :property_title => "MyString",
      :address => "MyString",
      :number_of_units => 1
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "input#property_property_title[name=?]", "property[property_title]"

      assert_select "input#property_address[name=?]", "property[address]"

      assert_select "input#property_number_of_units[name=?]", "property[number_of_units]"
    end
  end
end
