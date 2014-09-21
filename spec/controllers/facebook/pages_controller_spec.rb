require 'rails_helper'

describe Facebook::PagesController do
  render_views

  describe "#index" do
    before { create(:facebook_page) }

    it "returns the array of stored facebook pages" do
      get :index, format: :json
      res = JSON.parse(response.body)
      expect(res.count).to eq(1)
    end
  end

  describe "#create" do
    it "creates a facebook page from the given id" do
      expect {
        post :create, page: { facebook_id: "188091757763" }, format: :json
      }.to change(FacebookPage, :count).by(1)
    end

    it "does not create the page if the id is incorrect" do
      post :create, page: { facebook_id: "" }, format: :json
      res = JSON.parse(response.body)
      expect(response.status).to eq(422)
      expect(res).to eq({
        "page" => {
          "errors" => "Please provide a valid facebook page id"
        }
      })
    end
  end
end
