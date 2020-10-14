require "rails_helper"

RSpec.describe PlanController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/plan").to route_to("plan#index")
    end

    it "routes to #new" do
      expect(get: "/plan/new").to route_to("plan#new")
    end

    it "routes to #show" do
      expect(get: "/plan/1").to route_to("plan#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plan/1/edit").to route_to("plan#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/plan").to route_to("plan#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plan/1").to route_to("plan#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plan/1").to route_to("plan#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plan/1").to route_to("plan#destroy", id: "1")
    end
  end
end
