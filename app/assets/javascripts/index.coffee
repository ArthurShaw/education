# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
    location_json = $("#location").text();
    unless location_json
        return
    location_json = JSON.parse(location_json)


    handler = Gmaps.build('Google')
    handler.buildMap {
        provider:
          scrollwheel: false
        internal:
            id: 'location-place'
    }, ->
        markers = handler.addMarkers([{
            lat: location_json['latitude'],
            lng: location_json['longitude'],
            'picture': {
                'url': 'http://maps.google.com/mapfiles/ms/micons/pink-dot.png'
                'width': 32
                'height': 32
            },
            'infowindow': 'hello!'
        }])
        handler.map.centerOn markers[0]
        handler.getMap().setZoom(14);
)