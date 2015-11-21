class Admin::SectionsController < ApplicationController
  before_action :check_permission

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
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to admin_sections_path
  end

  private

  def sections_params
    params.require(:section).permit(:title)
  end

  def check_permission
    unless current_user.has_role? :admin
      render 'errors/403', :status => 403
    end
  end

end
