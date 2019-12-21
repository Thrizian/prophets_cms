# frozen_string_literal: true

# Basic AppController with forgery protection and a custom
# method to confirm if the session contains the :user_id.
# if so the user is authenticated.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    return if session[:user_id]

    flash[:error] = 'You have to prove you\'re admin first!'
    redirect_to access_login_path
  end
end
