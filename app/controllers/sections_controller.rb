class SectionsController < ApplicationController
  before_action :check_permission, only: [:new, :create, :edit, :update, :destroy]

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def edit
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.new(sections_params)
    @section.save
    redirect_to profile_path
  end

  def update
    @section = Section.find(params[:id])
    @section = Section.update(workshop_params)
    redirect_to profile_path
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    redirect_to profile_path
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
