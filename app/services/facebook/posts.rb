module Facebook
  module Posts
    extend self
    def all(facebook_id, user)
      graph = Koala::Facebook::API.new(user.access_token)
      get_posts(graph, facebook_id)
    rescue Koala::Facebook::AuthenticationError => e
      user.renew_token
      all(facebook_id, user)
    end

    # To get wall posts, use get_connections(user, "feed")
    def get_posts(graph, facebook_id)
      graph.get_connections(facebook_id, "feed", { limit: 10 })
    end
  end
end
