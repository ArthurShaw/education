# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  $("#js_section_select").on("change", ->
    text = $("#js_section_select option:selected").text();
    splitted = text.split(" | ")
    $("#js_workshop_title").val(splitted[0])
    $("#js_workshop_title_en").val(splitted[1])
  )
)

