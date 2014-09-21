module Facebook
  class BaseController < ApplicationController
    before_filter :authenticate_user!

    include ActionController::MimeResponds
  end
end
