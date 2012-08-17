class HomePageController < ApplicationController
   layout "homepage" 
   def dashboard
    if !user_signed_in?
#      redirect_to new_user_session_path
    else
      redirect_to user_root_url,alert: flash[:alert]
    end
  end
end
