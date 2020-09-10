require "rails_helper"

RSpec.describe BuisenessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/buisenesses").to route_to("buisenesses#index")
    end

    it "routes to #new" do
      expect(get: "/buisenesses/new").to route_to("buisenesses#new")
    end

    it "routes to #show" do
      expect(get: "/buisenesses/1").to route_to("buisenesses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/buisenesses/1/edit").to route_to("buisenesses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/buisenesses").to route_to("buisenesses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/buisenesses/1").to route_to("buisenesses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/buisenesses/1").to route_to("buisenesses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/buisenesses/1").to route_to("buisenesses#destroy", id: "1")
    end
  end
end
