require "rails_helper"

RSpec.describe QuestionaireAnswersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/questionaire_answers").to route_to("questionaire_answers#index")
    end

    it "routes to #new" do
      expect(get: "/questionaire_answers/new").to route_to("questionaire_answers#new")
    end

    it "routes to #show" do
      expect(get: "/questionaire_answers/1").to route_to("questionaire_answers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/questionaire_answers/1/edit").to route_to("questionaire_answers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/questionaire_answers").to route_to("questionaire_answers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/questionaire_answers/1").to route_to("questionaire_answers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/questionaire_answers/1").to route_to("questionaire_answers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/questionaire_answers/1").to route_to("questionaire_answers#destroy", id: "1")
    end
  end
end
