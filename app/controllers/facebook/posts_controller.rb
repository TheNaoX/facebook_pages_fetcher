module Facebook
  class PostsController < Facebook::BaseController
    def index
      page = FacebookPage.find(params[:page_id])
      @posts = Facebook::Posts.all(page.facebook_id)
    end
  end
end
