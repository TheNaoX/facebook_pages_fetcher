module Facebook
  class PostsController < ApplicationController
    before_filter :authenticate_user!
    def index
      page = FacebookPage.find(params[:page_id])
      @posts = Facebook::Posts.all(page.facebook_id)
    end
  end
end
