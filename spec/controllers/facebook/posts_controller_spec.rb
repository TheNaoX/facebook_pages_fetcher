require 'rails_helper'

describe Facebook::PostsController do
  render_views

  let(:user) { create(:user) }
  before { sign_in user }

  describe "#index" do
    let(:page) { create(:facebook_page) }

    it "returns the first 10 publications in the wall" do
      VCR.use_cassette("facebook-page-posts") do
        get :index, page_id: page.id, format: :json
        expect(response).to be_successful
        res = JSON.parse(response.body)
        expect(res).to be_kind_of(Array)
      end
    end
  end
end
