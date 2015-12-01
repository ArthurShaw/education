class Admin::SpecialGuestsController < ApplicationController

  before_action { check_permission(:admin) }
  before_action :find_special_guest, only: [:update, :destroy, :edit]

  def new
    @special_guest = SpecialGuest.new
  end

  def index
    @special_guests = SpecialGuest.all
  end

  def edit
  end

  def create
    @special_guest = SpecialGuest.new(special_guests_params)
    if @special_guest.save
      redirect_to admin_special_guests_path
    else
      render 'new', :status => :bad_request
    end
  end

  def update
    @special_guest.update(special_guests_params)
    redirect_to admin_special_guests_path
  end

  def destroy
    @special_guest.destroy
    redirect_to admin_special_guests_path
  end

  private

  def find_special_guest
    @special_guest = SpecialGuest.find(params[:id])
    render_404 unless @special_guest
  end

  def special_guests_params
    params.require(:special_guest).permit(:first_name, :last_name, :middle_name, :about, :avatar, :first_name_en, :last_name_en, :middle_name_en, :about_en, :guest_type, :about_long, :about_long_en)
  end
end
