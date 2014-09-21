require 'rails_helper'

describe Facebook::PagesController do
  render_views

  let(:user) { create(:user) }

  before { sign_in user }

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
      VCR.use_cassette('facebook-page-response') do
        expect do
          post :create, page: { facebook_id: "188091757763" }, format: :json
        end.to change(FacebookPage, :count).by(1)
      end
    end

    it "does not create the page if the id is incorrect" do
      VCR.use_cassette('facebook-page-response-error') do
        post :create, page: { facebook_id: "" }, format: :json
        res = JSON.parse(response.body)
        expect(response.status).to eq(422)
        expect(res).to eq({ "page" => {
          "errors" => "Please provide a valid facebook page id"
        }})
      end
    end
  end
end
