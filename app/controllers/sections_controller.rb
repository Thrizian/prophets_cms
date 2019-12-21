# frozen_string_literal: true

# CRUD Operations for sections as a nested object to pages
class SectionsController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  # To prevent having to define a section many times throughout this controller
  # use a private method to find the section for us.
  before_action :find_section, only: %i[show edit update delete destroy]
  before_action :find_page
  before_action :set_section_count, only: %i[new create edit update]

  def index
    @sections = @page.sections.sorted
  end

  def show; end

  def new
    @section = Section.new(page_id: @page.id)
  end

  def create
    @section = Section.new(section_params)
    @section.page_id = @page

    if @section.save
      flash[:notice] = 'Section saved successfully.'
      redirect_to sections_path(page_id: @page.id)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section updated successfully.'
      redirect_to section_path(@section, page_id: @page.id)
    else
      render :edit
    end
  end

  def delete; end

  def destroy
    @section.destroy

    flash[:notice] = "Section '#{@section.name}'successfully destroyed."
    redirect_to sections_path(page_id: @page.id)
  end

  private

  def set_section_count
    @section_count = @page.sections.count
    @section_count += 1 if params[:action].in? %w[new create]
  end

  def section_params
    params.require(:section).permit(
        :name, :content_type, :position, :visible, :content
    )
  end

  def find_section
    @section ||= Section.find(params[:id])
  end

  def find_page
    @page = Page.find(params[:page_id])
  end

end
