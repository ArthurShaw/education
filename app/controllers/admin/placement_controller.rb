class Admin::PlacementController < ApplicationController
  before_action :check_permission
  def index
    placement = PageContent.find(4)
    @placement_json = placement.content
  end

  def edit
  end

  def update
    @address = PageContent.find(4)

    address = params[:address]

    location = Geokit::Geocoders::MultiGeocoder.do_geocode(address)
    lat_lng_hash = {latitude: location.lat, longitude: location.lng}

    address_json =lat_lng_hash.to_json

    @address.update(:content => address_json)
    redirect_to admin_placement_path
  end

  private

  def check_permission
    render_403 unless current_user.has_role? :admin
  end
end
