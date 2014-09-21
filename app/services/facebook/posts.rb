module Facebook
  module Posts
    extend self
    def all(facebook_id)
      token = Rails.application.secrets.facebook_token
      graph = Koala::Facebook::API.new(token)
      get_posts(graph, facebook_id)
    end

    # To get wall posts, use get_connections(user, "feed")
    def get_posts(graph, facebook_id)
      graph.get_connections(facebook_id, "feed", { limit: 10 })
    end
  end
end
