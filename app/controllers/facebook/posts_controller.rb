module Facebook
  class PostsController < Facebook::BaseController
    def index
      page = FacebookPage.find(params[:page_id])
      @posts = Facebook::Posts.all(page.facebook_id, current_user)
    end
  end
end
