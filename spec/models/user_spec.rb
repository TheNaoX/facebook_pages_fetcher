require 'rails_helper'

describe User, "associations" do
  it { expect(subject).to have_many(:facebook_pages) }
end

describe User do
  describe ".from_omniauth" do
    let(:credentials) { double token: "foo", expires_at: 1.hour.from_now.to_i }
    let(:info) { double email: "email@example.com", name: "John", image: "http://google.com" }
    let(:auth) { double provider: "facebook", uid: "12345678", info: info, credentials: credentials }

    it "creates the user from omniauth" do
      expect do
        User.from_omniauth(auth)
      end.to change(User, :count).by(1)
    end

    it "gets the already created user" do
      User.from_omniauth(auth)
      expect do
        User.from_omniauth(auth)
      end.to_not change(User, :count)
    end
  end

  describe "#renew_token" do
    let(:user) { create(:user) }

    it "gets the token from the oauth API and updates it" do
      VCR.use_cassette("user-oauth-token") do
        token      = user.access_token
        expires_at = user.access_token_expires
        user.renew_token
        expect(user.access_token).to_not eq(token)
        expect(user.access_token_expires).to be > expires_at
      end
    end
  end
end
