# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  location_json = $("#location").text();
  unless location_json
    return
  location_json = JSON.parse(location_json)

  place_markers = [];
  console.log(location_json)
  $.each location_json, (location) ->
    console.log(location)
    place_markers.push(
      {
        lat: location_json[location]['latitude'],
        lng: location_json[location]['longitude'],
        'picture': {
          'url': 'http://maps.google.com/mapfiles/ms/micons/pink-dot.png'
          'width': 32
          'height': 32
        },
        'infowindow': 'hello!'
      }
    )

  handler = Gmaps.build('Google')
  handler.buildMap {
    provider:
      scrollwheel: false
    internal:
      id: 'location-place'
      autoZoom: true
  }, ->
    markers = handler.addMarkers(place_markers)
    handler.map.centerOn markers[0]
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
)

