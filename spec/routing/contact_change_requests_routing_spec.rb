require "rails_helper"

RSpec.describe ContactChangeRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contact_change_requests").to route_to("contact_change_requests#index")
    end

    it "routes to #new" do
      expect(get: "/contact_change_requests/new").to route_to("contact_change_requests#new")
    end

    it "routes to #show" do
      expect(get: "/contact_change_requests/1").to route_to("contact_change_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/contact_change_requests/1/edit").to route_to("contact_change_requests#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contact_change_requests").to route_to("contact_change_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contact_change_requests/1").to route_to("contact_change_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contact_change_requests/1").to route_to("contact_change_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contact_change_requests/1").to route_to("contact_change_requests#destroy", id: "1")
    end
  end
end
