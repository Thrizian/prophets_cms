class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  # To prevent having to define a section many times throughout this controller
  # use a private method to find the section for us.
  before_action :find_section, only: [:show, :edit, :update, :delete, :destroy]


  def index

    @sections = Section.sorted
  end

  def show
  end

  def new
    @section_count = Section.count + 1
    @pages = Page.sorted
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    if @section.save
      flash[:notice] = 'Section saved successfully.'
      redirect_to sections_path
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render :new
    end

  end

  def edit
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section updated successfully.'
      redirect_to section_path(@section)
    else
      @section_count = Section.count
      @pages = Page.sorted
      render :edit
    end
  end

  def delete
  end

  def destroy
    @section.destroy

    flash[:notice] = "Section '#{@section.name}'successfully destroyed."
    redirect_to sections_path
  end

  private

  def section_params
    params.require(:section).permit(
        :page_id, :name, :content_type, :position, :visible, :content
    )
  end

  def find_section
    @section ||= Section.find(params[:id])
  end
end
