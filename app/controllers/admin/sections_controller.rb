class Admin::SectionsController < ApplicationController
  before_action :check_permission
  before_action :find_section, only: :destroy

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(sections_params)
    if @section.save
      redirect_to admin_sections_path
    else
      render 'new', :status => :bad_request
    end

  end

  def destroy
    @section.destroy
    redirect_to admin_sections_path
  end

  private

  def sections_params
    params.require(:section).permit(:title, :title_en)
  end

  def find_section
    @section = Section.find(params[:id])
    render_404 unless @section
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

end
