module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in @user
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
        redirect_to root_path
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        flash[:alert] = "There was an error with your facebook login." if is_navigational_format?
        redirect_to root_path
      end
    end
  end
end
