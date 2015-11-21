class WorkshopsController < ApplicationController
  before_action :check_permission

  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user_id = current_user.id
    if @workshop.save
      redirect_to profile_path
    else
      render 'new', :status => :bad_request
    end
  end

  def update
    @workshop = Workshop.find(params[:id])
    @workshop.update(workshop_params)
    redirect_to profile_path
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    redirect_to profile_path
  end


  private

  def workshop_params
    params.require(:workshop).permit(:title, :description, :section_id)
  end

  def check_permission
    unless current_user.has_role? :speaker
      render 'errors/403', :status => 403
    end
  end
end