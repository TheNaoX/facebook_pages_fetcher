require 'rails_helper'

describe Facebook::PagesController do
  describe "#create" do
    it "creates a facebook page from the given id" do
      expect {
        post :create, facebook_id: "329069337200839", format: :json
      }.to change(FacebookPage, :count).by(1)
    end
  end
end
