# CRUD Operations for pages as a nested object to subjects.
class PagesController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  # To prevent having to define a page many times throughout this controller
  # use a private method to find the page for us.
  before_action :find_page, only: %i[show edit update delete destroy]
  before_action :find_subject
  before_action :set_page_count, only: %i[new create edit update]

  def index
    @pages = @subject.pages.sorted
  end

  def show; end

  def new
    @page = Page.new(subject_id: @subject.id)
  end

  def create
    @page = Page.new(page_params)
    @page.subject_id = @subject.id

    if @page.save
      flash[:notice] = 'Page saved successfully.'
      redirect_to pages_path(subject_id: @subject.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = 'Page updated successfully.'
      redirect_to page_path(@page, subject_id: @subject.id)
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @page.destroy

    flash[:notice] = "Page '#{@page.name}' successfully destroyed."
    redirect_to pages_path(subject_id: @subject.id)
  end

  private

  def set_page_count
    @page_count = @subject.pages.count
    @page_count += 1 if params[:action].in? %w[new create]
  end

  def page_params
    params.require(:page).permit(
      :name, :permalink, :position, :visible
    )
  end

  def find_page
    @page ||= Page.find(params[:id])
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end
end
