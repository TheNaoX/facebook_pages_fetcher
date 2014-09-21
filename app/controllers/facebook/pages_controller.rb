module Facebook
  class PagesController < ApplicationController
    def create
      Facebook::PagesCreator.(pages_params[:facebook_id])
      render :show, status: :created
    end

    private

    def pages_params
      params.fetch(:page, {}).permit(:facebook_id)
    end
  end
end
