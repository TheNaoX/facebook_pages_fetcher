module Facebook
  module PagesCreator
    extend self

    def call(facebook_id, user)
      graph = Koala::Facebook::API.new(user.access_token)
      create_page(graph, facebook_id, user.id)
    rescue Koala::Facebook::AuthenticationError => e
      user.renew_token
      call(facebook_id, user)
    end

    def create_page(graph, facebook_id, user_id)
      page    = graph.get_object  facebook_id
      picture = graph.get_picture facebook_id

      FacebookPage.create_page(facebook_id, page["name"], picture, user_id)
    end
  end
end
