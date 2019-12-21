class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   private

   def confirm_logged_in
      unless session[:user_id]
         flash[:error] = 'You have to prove you\'re admin first!'
         redirect_to access_login_path
      end
   end
end
