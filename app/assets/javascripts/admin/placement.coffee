# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  $("#js_add_address").on("click", ->
    $("#js_address_inputs").append('<input type="text" name="address[]" class="form-control"><br>')
  )
)