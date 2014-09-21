require 'spec_helper'

describe Users::OmniauthCallbacksController do
  describe "#facebook" do
    it "creates the session from the omniauth response" do
      expect do
        get :facebook
      end.to change(User, :count).by 1
    end
  end
end
