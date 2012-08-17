class HomePageController < ApplicationController
  def dashboard
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      render text: "OK", status: "200"
    end
  end
end
