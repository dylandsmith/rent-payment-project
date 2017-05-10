require "rails_helper"

RSpec.describe PropertyOwnersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/property_owners").to route_to("property_owners#index")
    end

    it "routes to #new" do
      expect(:get => "/property_owners/new").to route_to("property_owners#new")
    end

    it "routes to #show" do
      expect(:get => "/property_owners/1").to route_to("property_owners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/property_owners/1/edit").to route_to("property_owners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/property_owners").to route_to("property_owners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/property_owners/1").to route_to("property_owners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/property_owners/1").to route_to("property_owners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/property_owners/1").to route_to("property_owners#destroy", :id => "1")
    end

  end
end
