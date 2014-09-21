require_relative "../../../app/services/facebook/pages_creator"

describe Facebook::PagesCreator do
  describe "#call" do
    let(:facebook_id) { "188091757763" }

    it "creates the facebook page through the API" do
      VCR.use_cassette('facebook-page-response') do
        expect do
          Facebook::PagesCreator.(facebook_id)
        end.to change(FacebookPage, :count).by(1)
      end
    end
  end
end
