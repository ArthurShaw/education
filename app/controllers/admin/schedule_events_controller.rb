class Admin::ScheduleEventsController < ApplicationController

  before_action { check_permission(:admin) }
  before_action :find_schedule_event, only: [:edit, :update, :destroy]
  before_action :check_ajax_only, only: [:new, :create, :destroy]
  skip_filter :verify_authenticity_token, :destroy


  def new
    @schedule_event = ScheduleEvent.new
    @workshops = Workshop.where(:status => Workshop.statuses[:confirmed])
    render :partial => 'admin/schedule_events/new'
  end

  def create
    @schedule_event = ScheduleEvent.new(schedule_events_params)
    @schedule_event.schedule_sub_interval_id = params['schedule_sub_interval_id']
    if @schedule_event.save
      schedule_interval = ScheduleInterval.find(params['schedule_interval_id'])
      render :partial => 'admin/schedule_intervals/show', locals: {schedule_interval: schedule_interval}
    else
      render :nothing => true, status: 402
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @schedule_event.destroy
    schedule_interval = ScheduleInterval.find(params['schedule_interval_id'])
    render :partial => 'admin/schedule_intervals/show', locals: {schedule_interval: schedule_interval}
  end

  private

  def schedule_events_params
    params.require(:schedule_event).permit(:title, :title_en, :workshop_id)
  end

  def find_schedule_event
    @schedule_event = ScheduleEvent.find(params[:id])
    render_404 unless @schedule_event
  end

end
