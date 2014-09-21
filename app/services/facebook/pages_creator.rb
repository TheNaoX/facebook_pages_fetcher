module Facebook
  module PagesCreator
    extend self

    def call(facebook_id)
      token = Rails.application.secrets.facebook_token
      graph = Koala::Facebook::API.new(token)
      create_page(graph, facebook_id)
    end

    def create_page(graph, facebook_id)
      page    = graph.get_object  facebook_id
      picture = graph.get_picture facebook_id

      FacebookPage.create_page(facebook_id, page["name"], picture)
    end
  end
end
