class WorkshopsController < ApplicationController
  before_action except: [:info] {check_permission(:speaker)}
  before_action :find_workshop, only: [:show, :edit, :update, :destroy, :info]

  def index
    @workshops = Workshop.all
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(:workshop => @workshop)
  end

  def info
    render :partial => 'workshops/info'
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
    params.require(:workshop).permit(:title, :description, :section_id, :title_en, :description_en)
  end

  def find_workshop
    @workshop = Workshop.find(params[:id])
    render_404 unless @workshop
  end



end