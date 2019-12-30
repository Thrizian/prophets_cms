# The public controller uses the public layout to serve all
# pages meant for the public as soon as: subjects, pages, sections
# are checked to be visible.
class PublicController < ApplicationController
  layout 'public'

  before_action :prepare_navigation

  def index
    # intro text
  end

  def show

    # look up page that matches permalink
    @page = Page.visible.where(permalink: params[:permalink]).first
    return unless @page.nil?

    flash[:notice] = 'Sorry this page does not exist.'
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def prepare_navigation
    @subjects = Subject.visible.sorted
  end
end
