require 'rails_helper'

describe HomeController do
  describe "#index" do
    context "when user is signed in" do
      let(:user) { create(:user) }
      before { sign_in user }
      it "renders the index successfully" do
        get :index
        expect(response).to be_successful
      end
    end

    context "when user is not signed in" do
      it "renders the index successfully" do
        get :index
        expect(request).to redirect_to(enter_home_index_path)
      end
    end
  end
end
