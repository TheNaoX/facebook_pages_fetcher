require 'rails_helper'

describe Users::OmniauthCallbacksController do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  describe "#facebook" do
    it "creates the session from the omniauth response" do
      expect do
        get :facebook
        expect(request).to redirect_to(root_path)
      end.to change(User, :count).by 1
    end
  end
end
