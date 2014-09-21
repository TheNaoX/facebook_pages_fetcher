module Facebook
  class PagesController < ApplicationController
    rescue_from Koala::Facebook::ClientError do |e|
      render json: { page: { errors: "Please provide a valid facebook page id" } },
        status: :unprocessable_entity
    end

    include ActionController::MimeResponds

    def index
      @pages = FacebookPage.all
    end

    def create
      @page = Facebook::PagesCreator.(pages_params[:facebook_id])
      render :show, status: :created
    end

    private

    def pages_params
      params.fetch(:page, {}).permit(:facebook_id)
    end
  end
end
