require 'rails_helper'

RSpec.describe "PropertyOwners", type: :request do
  describe "GET /property_owners" do
    it "works! (now write some real specs)" do
      get property_owners_path
      expect(response).to have_http_status(200)
    end
  end
end
