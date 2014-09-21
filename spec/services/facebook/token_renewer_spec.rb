require 'rails_helper'

describe Facebook::TokenRenewer do
  describe "#call" do
    let(:user) { create(:user) }

    it "gets a new token from the API" do
      VCR.use_cassette("user-oauth-token") do
        oauth_hash = Facebook::TokenRenewer.(user.access_token)
        expect(oauth_hash).to eq({
          "access_token"=>"CAAVAaohiQCsBAJeYzKeuG0j84VYq4DcyJqlRlkvCIewZAkn8KcGyQ1isxrAHYWX1p99f178pDNoaJE0jyrcPZA4CUDq0DZBOAjdNkVIPfEN7gjNhM30iZCjD3ipH57yplGVyKaGld4W17kh1smpCpmouEmj5n1kIgVKGO7tdjYYomebVQZCLS",
          "expires"     =>"5174015"
        })
      end
    end
  end
end
