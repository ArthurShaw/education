class Admin::EventsController < ApplicationController

  before_action :check_permission
  before_action :find_event, only: [:update, :destroy, :edit]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    sections = Section.where(:id => params[:event][:section_ids])
    @event.sections << sections
    if @event
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  def edit

  end

  private

  def find_event
    @event = Event.find(params[:id])
    render_404 unless @event
  end

  def check_permission
    render_403 unless current_user.has_role? :admin
  end

  def event_params
    params.require(:event).permit(:title, :title_en, :description, :description_en, :workshop, :section_ids, :from, :to, :date)
  end

end
