require 'rails_helper'

RSpec.describe "property_owners/new", type: :view do
  before(:each) do
    assign(:property_owner, PropertyOwner.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :owner_address => "MyString",
      :owner_phone => "MyString",
      :number_of_properties => 1
    ))
  end

  it "renders new property_owner form" do
    render

    assert_select "form[action=?][method=?]", property_owners_path, "post" do

      assert_select "input#property_owner_first_name[name=?]", "property_owner[first_name]"

      assert_select "input#property_owner_last_name[name=?]", "property_owner[last_name]"

      assert_select "input#property_owner_owner_address[name=?]", "property_owner[owner_address]"

      assert_select "input#property_owner_owner_phone[name=?]", "property_owner[owner_phone]"

      assert_select "input#property_owner_number_of_properties[name=?]", "property_owner[number_of_properties]"
    end
  end
end
