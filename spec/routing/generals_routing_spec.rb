require "rails_helper"

RSpec.describe GeneralsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/generals").to route_to("generals#index")
    end

    it "routes to #new" do
      expect(get: "/generals/new").to route_to("generals#new")
    end

    it "routes to #show" do
      expect(get: "/generals/1").to route_to("generals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/generals/1/edit").to route_to("generals#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/generals").to route_to("generals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/generals/1").to route_to("generals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/generals/1").to route_to("generals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/generals/1").to route_to("generals#destroy", id: "1")
    end
  end
end
