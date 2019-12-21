class AccessController < ApplicationController

  layout 'admin'

  # Except used to whitelist safe by default.
  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def menu
    # display text and links
    @admin_user = AdminUser.find(session[:user_id])
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      admin_user = AdminUser.where(username: params[:username]).first
      if admin_user
        authorized_user = admin_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = 'You are now logged in'
      redirect_to admin_path, locals: { admin_user: authorized_user}
    else
      flash.now[:error] = 'As far as we know you don\'t exist, you can try again with proper credentials.'
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out.'
    redirect_to access_login_path
  end

end
