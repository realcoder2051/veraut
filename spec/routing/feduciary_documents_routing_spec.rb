require "rails_helper"

RSpec.describe FeduciaryDocumentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/feduciary_documents").to route_to("feduciary_documents#index")
    end

    it "routes to #new" do
      expect(get: "/feduciary_documents/new").to route_to("feduciary_documents#new")
    end

    it "routes to #show" do
      expect(get: "/feduciary_documents/1").to route_to("feduciary_documents#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/feduciary_documents/1/edit").to route_to("feduciary_documents#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/feduciary_documents").to route_to("feduciary_documents#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/feduciary_documents/1").to route_to("feduciary_documents#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/feduciary_documents/1").to route_to("feduciary_documents#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/feduciary_documents/1").to route_to("feduciary_documents#destroy", id: "1")
    end
  end
end
