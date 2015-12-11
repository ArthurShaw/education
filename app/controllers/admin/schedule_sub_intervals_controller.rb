class Admin::ScheduleSubIntervalsController < ApplicationController

  before_action { check_permission(:admin) }
  before_action :find_schedule_sub_interval, only: [:edit, :update, :destroy]
  before_action :check_ajax_only, only: [:new, :create]


  def index
    @schedule_sub_intervals = ScheduleSubInterval.where(:schedule_interval_id => params['schedule_interval_id'])
  end

  def new
    @schedule_sub_interval = ScheduleSubInterval.new
    render partial: 'admin/schedule_sub_intervals/new'
  end

  def create
    @schedule_sub_interval = ScheduleSubInterval.new(schedule_sub_interval_params)
    @schedule_sub_interval.schedule_interval_id = params['schedule_interval_id']
    if @schedule_sub_interval.save
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

  end


  private

  def schedule_sub_interval_params
    params.require(:schedule_sub_interval).permit(:from, :to)
  end

  def find_schedule_sub_interval
    @schedule_sub_interval = ScheduleSubInterval.find(params[:id])
    render_404 unless @schedule_sub_interval
  end

end
