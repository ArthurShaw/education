class SpecialGuestsController < ApplicationController

  def guests
    @guests = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:guest])
  end

  def speakers
    @speakers = SpecialGuest.where(:guest_type => SpecialGuest.guest_types[:speaker])
  end

  def show

  end

end
