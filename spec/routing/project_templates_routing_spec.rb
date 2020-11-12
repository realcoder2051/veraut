require "rails_helper"

RSpec.describe ProjectTemplatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project_templates").to route_to("project_templates#index")
    end

    it "routes to #new" do
      expect(get: "/project_templates/new").to route_to("project_templates#new")
    end

    it "routes to #show" do
      expect(get: "/project_templates/1").to route_to("project_templates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project_templates/1/edit").to route_to("project_templates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project_templates").to route_to("project_templates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project_templates/1").to route_to("project_templates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project_templates/1").to route_to("project_templates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project_templates/1").to route_to("project_templates#destroy", id: "1")
    end
  end
end
