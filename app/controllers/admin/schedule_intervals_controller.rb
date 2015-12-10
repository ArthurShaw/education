class Admin::ScheduleIntervalsController < ApplicationController

  before_action { check_permission(:admin) }
  before_action :find_schedule_interval, only: [:edit, :update, :destroy]

  def index
    @schedule_intervals = ScheduleInterval.all
  end

  def new
    @schedule_interval = ScheduleInterval.new
    @workshops = Workshop.where(:status => Workshop.statuses[:confirmed])
  end

  def create
    @schedule_interval = ScheduleInterval.new(schedule_interval_params)
    if @schedule_interval.save
      redirect_to admin_schedule_intervals_path
    else
      render 'new'
    end
  end

  def destroy
    @schedule_interval.destroy
    redirect_to admin_schedule_intervals_path
  end

  private

  def schedule_interval_params
    params.require(:schedule_interval).permit(:title, :title_en, :description, :description_en, :date, :from, :to, :workshop_id, :section_id)
  end

  def find_schedule_interval
    @schedule_interval = ScheduleInterval.find(params[:id])
    render_404 unless @schedule_interval
  end

end
