class WorkshopsController < ApplicationController
  before_action :check_permission
  before_action :find_workshop, only: [:show, :edit, :update, :destroy]

  def index
    @workshops = Workshop.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(:workshop => @workshop)
  end

  def new
    @workshop = Workshop.new
  end

  def edit
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
    @workshop.update(workshop_params)
    redirect_to profile_path
  end

  def destroy
    @workshop.destroy
    redirect_to profile_path
  end


  private

  def workshop_params
    params.require(:workshop).permit(:title, :description, :section_id)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
    render_404 unless @workshop
  end

  def check_permission
    render_403 unless current_user.has_role? :speaker
  end

end