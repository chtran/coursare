class HomePageController < ApplicationController
   layout "homepage"
   def index
     if user_signed_in?
       redirect_to courses_path
     end
  end
end
