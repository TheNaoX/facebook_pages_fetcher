require "rails_helper"

describe Facebook::PagesCreator do
  describe "#call" do
    let(:facebook_id) { "188091757763" }
    let(:user)        { create(:user)  }

    it "creates the facebook page through the API" do
      VCR.use_cassette('facebook-page-response') do
        expect do
          Facebook::PagesCreator.(facebook_id, user)
        end.to change(FacebookPage, :count).by(1)
      end
    end
  end
end
