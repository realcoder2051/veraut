require "rails_helper"

RSpec.describe FiftyFiveHundredsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fifty_five_hundreds").to route_to("fifty_five_hundreds#index")
    end

    it "routes to #new" do
      expect(get: "/fifty_five_hundreds/new").to route_to("fifty_five_hundreds#new")
    end

    it "routes to #show" do
      expect(get: "/fifty_five_hundreds/1").to route_to("fifty_five_hundreds#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fifty_five_hundreds/1/edit").to route_to("fifty_five_hundreds#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fifty_five_hundreds").to route_to("fifty_five_hundreds#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fifty_five_hundreds/1").to route_to("fifty_five_hundreds#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fifty_five_hundreds/1").to route_to("fifty_five_hundreds#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fifty_five_hundreds/1").to route_to("fifty_five_hundreds#destroy", id: "1")
    end
  end
end
