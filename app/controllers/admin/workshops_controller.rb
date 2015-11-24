class Admin::WorkshopsController < ApplicationController
  before_action :check_permission
  before_action :find_workshop, only: [:show, :edit, :update, :approve, :deny]

  def index
    # @sections = Section.all
    # section_params = params[:section_id]
    @workshops_special =  Workshop.where.not('workshops.special_guest_id' => nil)
    @workshops_usual = Workshop.where.not('workshops.user_id' => nil)
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.create(workshop_params)
    if @workshop
      redirect_to admin_workshops_path
    else
      render 'new'
    end
  end

  def destroy

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
    @workshop.update(:status => Workshop.statuses[:confirmed])
    redirect_to admin_workshop_path
  end

  def deny
    @workshop.update(:status => Workshop.statuses[:denied])
    redirect_to admin_workshop_path
  end

  private

  def workshop_params
    params.require(:workshop).permit(:title, :title_en, :description, :description_en, :special_guest_id, :section_id)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
    render_404 unless @workshop
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

end