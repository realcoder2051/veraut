require "rails_helper"

RSpec.describe ChangeRequestMappingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/change_request_mappings").to route_to("change_request_mappings#index")
    end

    it "routes to #new" do
      expect(get: "/change_request_mappings/new").to route_to("change_request_mappings#new")
    end

    it "routes to #show" do
      expect(get: "/change_request_mappings/1").to route_to("change_request_mappings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/change_request_mappings/1/edit").to route_to("change_request_mappings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/change_request_mappings").to route_to("change_request_mappings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/change_request_mappings/1").to route_to("change_request_mappings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/change_request_mappings/1").to route_to("change_request_mappings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/change_request_mappings/1").to route_to("change_request_mappings#destroy", id: "1")
    end
  end
end
