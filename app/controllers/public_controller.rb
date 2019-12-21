class PublicController < ApplicationController

  layout 'public'

  before_action :prepare_navigation

  def index
    # intro text
  end

  def show
    # look up page that matches permalink
    @page = Page.visible.where(permalink: params[:permalink]).first
    if @page.nil?
      flash[:notice] = 'Sorry this page does not exist.'
      redirect_to(root_path)
    else

    end
  end

  private

  def prepare_navigation
    @subjects = Subject.visible.sorted
  end
end
