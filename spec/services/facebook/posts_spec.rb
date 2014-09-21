require "rails_helper"

describe Facebook::Posts do
  describe "#all" do
    let(:user) { create(:user) }
    let(:facebook_id) { "188091757763" }

    it "creates the facebook page through the API" do
      VCR.use_cassette("facebook-page-posts") do
        posts = Facebook::Posts.all(facebook_id, user)
        expect(posts).to_not be_nil
        expect(posts).to be_kind_of(Array)
      end
    end
  end
end
