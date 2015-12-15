class SpecialGuestsController < ApplicationController

  def guests
    @guests = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:guest], :visible => true)
  end

  def speakers
    @speakers = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:speaker], :visible => true)
  end

  def show
    @person = SpecialGuest.find(params[:id])
    @workshops = Workshop.where(:special_guest_id => @person.id)
    render_404 unless @person
    render :partial => 'special_guests/show'
  end

end
