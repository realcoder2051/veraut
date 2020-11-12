require "rails_helper"

RSpec.describe TaskItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/task_items").to route_to("task_items#index")
    end

    it "routes to #new" do
      expect(get: "/task_items/new").to route_to("task_items#new")
    end

    it "routes to #show" do
      expect(get: "/task_items/1").to route_to("task_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/task_items/1/edit").to route_to("task_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/task_items").to route_to("task_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/task_items/1").to route_to("task_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/task_items/1").to route_to("task_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/task_items/1").to route_to("task_items#destroy", id: "1")
    end
  end
end
