class Admin::WorkshopsController < ApplicationController
  before_action :check_permission
  before_action :find_workshop, only: [:show, :edit, :update, :approve, :deny]

  def index
    @sections = Section.all
    section_params = params[:section_id]
    unless section_params.nil?
      @workshops = Workshop.where(section_id: section_params)
    else
      @workshops = Workshop.all
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(:workshop => @workshop)
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

  def approve
    @status = Workshop.statuses[:confirmed]
    @workshop.update(@status)
    redirect_to admin_workshop_path
  end

  def deny
    @workshop.update(:status => Workshop.statuses[:denied])
    redirect_to admin_workshop_path
  end


  private

  def workshop_params
    params.require(:workshop).permit(:title, :description, :status, :section_id)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
    render_404 unless @workshop
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

end