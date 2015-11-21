class Admin::SpecialGuestsController < ApplicationController
  before_action :check_permission

  def new
    @special_guest = SpecialGuest.new
  end

  def index
    @special_guests = SpecialGuest.all
  end

  def edit
    @special_guest = SpecialGuest.find(params[:id])
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
    @special_guest = SpecialGuest.find(params[:id])
    @special_guest.update(special_guests_params)
    redirect_to admin_special_guests_path
  end

  def destroy
    @special_guest = SpecialGuest.find(params[:id])
    @special_guest.destroy
    redirect_to admin_special_guests_path
  end

  private

  def check_permission
    unless user_signed_in? and current_user.has_role? :admin
      render 'errors/403', :status => 403
    end
  end

  def special_guests_params
    params.require(:special_guest).permit(:first_name, :last_name, :middle_name, :about, :avatar)
  end
end
