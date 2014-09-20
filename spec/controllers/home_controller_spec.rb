require 'rails_helper'

describe HomeController do
  describe "#index" do
    it "renders the index successfully" do
      get :index
      expect(response).to be_successful
    end
  end
end
