# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  $js_file_input_button = $("#js_file_input_button");
  $js_file_input_button.on("change", ->
    $("#js_file_input_span").html($js_file_input_button.val().replace(/\\/g, '/').replace(/.*\//, ''))
  )
)
