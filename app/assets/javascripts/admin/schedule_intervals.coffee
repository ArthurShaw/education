# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
  $("#js-schedules").on("change", "#js_workshop_select", ->
    text = $("#js_workshop_select option:selected").text();
    splitted = text.split(" | ")
    $("#js_workshop_title").val(splitted[0])
    $("#js_workshop_title_en").val(splitted[1])
  )

  $("#js-schedules").on("change", "#js_add_workshop_input", ->
    if $(this).prop("checked")
      $("#js_workshop_input").show()
    else
      $("#js_workshop_input").hide()
  )

  $("#js-schedules").on('click', ".js-create-sub-interval", (event)->
    event.preventDefault()
    $link = $(this);
    $.ajax($link.attr('href'), {
      success: (data) ->
        $link.closest(".schedule_row").children(".new-sub-interval-place").html(data)

    }))

  $("#js-schedules").on("submit", ".new-sub-interval-place form", (event)->
    event.preventDefault();
    $form = $(this)
    $.ajax($form.prop("action"), {
      type: 'POST',
      data: $form.serialize(),
      success: (data)->
        $form.closest(".schedule_row").html(data)
      error: ->
        console.log("ERROR")
    })
  )
)