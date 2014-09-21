class HomeController < ApplicationController
  def index
    redirect_to enter_home_index_path unless user_signed_in?
  end
end
