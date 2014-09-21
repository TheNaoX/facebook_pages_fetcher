module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      return session_success if user.persisted?
      session_error
    end

    def session_success
      sign_in user
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      redirect_to root_path
    end

    def session_error
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:alert] = "There was an error with your facebook login." if is_navigational_format?
      redirect_to root_path
    end

    private

    def user
      @user ||= User.from_omniauth(request.env["omniauth.auth"])
    end
  end
end
