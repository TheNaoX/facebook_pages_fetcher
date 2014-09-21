require 'rails_helper'

describe Facebook::PagesController do
  describe "#create" do
    it "creates a facebook page from the given id" do
      VCR.use_cassette('facebook-page-response') do
        expect {
          post :create,
            page: { facebook_id: "188091757763" },
            format: :json
        }.to change(FacebookPage, :count).by(1)
      end
    end
  end
end
