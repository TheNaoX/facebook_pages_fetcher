module Facebook
  class PagesController < ApplicationController
    def create
      render :show, status: :created
    end
  end
end
