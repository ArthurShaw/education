class Admin::EventsController < ApplicationController

  before_action :check_permission
  before_action :find_event, only: [:update, :destroy, :edit]

  def index
    @sections = Section.all
    section_params = params[:section_id]
    if section_params
      @events = Event.order(:date, :from).joins(:events_sections).where('events_sections.section_id' => [section_params])
    else
      @events = Event.order(:date, :from)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    sections = Section.where(:id => params[:event][:section_ids])
    @event.sections << sections
    if @event.save
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
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
    params.require(:event).permit(:title, :title_en, :description, :description_en, :workshop_id, :section_ids, :from, :to, :date)
  end

end
