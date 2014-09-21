module Facebook
  module TokenRenewer
    extend self

    def call(current_access_token)
      client_id     = Rails.application.secrets.facebook_app_id
      client_secret = Rails.application.secrets.facebook_app_secret
      oauth = Koala::Facebook::OAuth.new(client_id, client_secret)
      facebook_oauth.exchange_access_token_info(current_access_token)
    end
  end
end
