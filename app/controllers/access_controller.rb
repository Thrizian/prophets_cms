# frozen_string_literal: true

# The access controller handles
# - redirection to the admin menu after successful login
# - login form
# - login-attempts storing a session user_id
# - logging out
class AccessController < ApplicationController
  layout 'admin'

  # Except used to whitelist safe by default.
  before_action :confirm_logged_in, except: %i[login attempt_login logout]

  def menu
    # display text and links
    @full_name = session[:full_name]
  end

  def login
    # login form
  end

  def attempt_login
    check_user_authorization

    if @authorized_user
      session[:user_id]   = @authorized_user.id
      session[:full_name] = @authorized_user.full_name
      flash[:notice]      = 'You are now logged in'
      redirect_to admin_path, locals: { admin_user: @authorized_user }
    else
      flash.now[:error] = 'As far as we know you don\'t exist, ' \
                          'you can try again with proper credentials.'
      render :login
    end
  end

  def logout
    session[:user_id]   = nil
    session[:full_name] = nil
    flash[:notice]      = 'You have been logged out.'
    redirect_to access_login_path
  end

  private

  # This method authenticates the user based on the presense of username
  # and password and authentication of this password.
  def check_user_authorization
    return unless params[:username].present? && params[:password].present?

    admin_user = AdminUser.where(username: params[:username]).first
    return unless admin_user

    @authorized_user = admin_user.authenticate(params[:password])
  end
end
