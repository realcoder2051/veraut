require "rails_helper"

RSpec.describe RoleRightsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/role_rights").to route_to("role_rights#index")
    end

    it "routes to #new" do
      expect(get: "/role_rights/new").to route_to("role_rights#new")
    end

    it "routes to #show" do
      expect(get: "/role_rights/1").to route_to("role_rights#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/role_rights/1/edit").to route_to("role_rights#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/role_rights").to route_to("role_rights#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/role_rights/1").to route_to("role_rights#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/role_rights/1").to route_to("role_rights#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/role_rights/1").to route_to("role_rights#destroy", id: "1")
    end
  end
end
