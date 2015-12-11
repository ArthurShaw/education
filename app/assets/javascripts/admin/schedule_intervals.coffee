# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  $("#js_workshop_select").on("change", ->
    text = $("#js_workshop_select option:selected").text();
    splitted = text.split(" | ")
    $("#js_workshop_title").val(splitted[0])
    $("#js_workshop_title_en").val(splitted[1])
  )

  $("#js_add_workshop_input").on("change", ->
    if $(this).prop("checked")
      $("#js_workshop_input").show()
    else
      $("#js_workshop_input").hide()
  )
)