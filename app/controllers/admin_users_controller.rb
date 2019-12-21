# frozen_string_literal: true

# Provides the CRUD for AdminUsers
class AdminUsersController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_admin_user, only: %i[edit update delete destroy]

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    if @admin_user.save
      flash[:notice] = 'Admin saved successfully'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    # render form for admin_user
  end

  def update
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = 'Admin updated successfully.'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def delete
    # render delete for admin_user
  end

  def destroy
    @admin_user.destroy
    flash.now[:notice] = "#{@admin_user.full_name} has been destroyed"
    redirect_to admin_users_path
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password,
      :password_confirmation
    )
  end

  def find_admin_user
    @admin_user = AdminUser.find(params[:id])
  end
end
