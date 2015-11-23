class Admin::WorkshopsController < ApplicationController
  before_action :check_permission
  before_action :find_workshop, only: [:show, :edit, :update]

  def index
    @workshops = Workshop.all
  end

  def show
  end

  def edit
  end

  def update
    if @workshop.update(workshop_params)
      redirect_to admin_workshop_path
    else
      render 'edit'
    end
  end

  private

  def workshop_params
    params.require(:workshop_params).permit(:title, :description, :status, :section_id)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
    render_404 unless @workshop
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

end