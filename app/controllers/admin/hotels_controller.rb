class Admin::HotelsController < ApplicationController
  before_action { check_permission(:admin) }
  before_action :find_hotel, only: :destroy

  def index
    @hotels = Hotel.all
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      redirect_to admin_hotels_path
    end
  end

  def destroy
    @hotel.destroy
    redirect_to admin_hotels_path
  end
  private

  def hotel_params
    params.require(:hotel).permit(:title, :title_en)
  end

  def find_hotel
    @hotel = Hotel.find(params[:id])
    render_404 unless @hotel
  end
end
