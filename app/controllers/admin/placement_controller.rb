class Admin::PlacementController < ApplicationController
  before_action { check_permission(:admin) }
  def index
    placement = PageContent.find(4)
    @placement_json = placement.content
  end

  def update
    @address = PageContent.find(4)

    address_array = []

    for address in params[:address]
      next if address.empty?
      location = Geokit::Geocoders::MultiGeocoder.do_geocode(address)
      lat_lng_hash = {
          latitude: location.lat,
          longitude: location.lng,
          address_string: address
      }
      address_array << lat_lng_hash
    end

    address_json = address_array.to_json

    @address.update(:content => address_json)
    redirect_to admin_placement_path
  end

end
