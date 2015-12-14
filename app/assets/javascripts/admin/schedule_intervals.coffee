# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("page:change", ->
#  ----------- Создание
  $("#js_workshop_select").change(->
    text = $("#js_workshop_select option:selected").text();
    splitted = text.split(" | ")
    $("#js_workshop_title").val(splitted[0])
    $("#js_workshop_title_en").val(splitted[1])
  )

  $("#js_add_workshop_input").change(->
    if $(this).prop("checked")
      $("#js_workshop_input").show()
    else
      $("#js_workshop_input").hide()
  )

  # --------------- Изменение

  $("#js-schedules").on('click', ".js-create-sub-interval", (event)->
    hideForms()
    $link = $(this);
    $.ajax($link.attr('href'), {
      beforeSend: (xhr)->
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      success: (data) ->
        $link.closest(".schedule_row").children(".new-sub-interval-place").html(data)

    })
    return false
  )

  $("#js-schedules").on('click', ".js-delete-sub-interval", (event)->
    $link = $(this);
    $.ajax($link.attr('href'), {
      type: 'DELETE',
      beforeSent: (xhr) ->
        xhr.setRequestHeader( 'X-CSRF-Token', $("meta[name='csrf-token']" ).attr('content'));
      success: (data) ->
        $link.closest(".schedule_row").html(data)
    })
    return false
  )


  $("#js-schedules").on("submit", ".new-sub-interval-place form", (event)->
    $form = $(this)
    $.ajax($form.prop("action"), {
      type: 'POST',
      data: $form.serialize(),
      success: (data)->
        $form.closest(".schedule_row").html(data)
      error: ->
        console.log("ERROR")
    })
    return false
  )

  $("#js-schedules").on('click', ".js-create-schedule-event", (event)->
    event.preventDefault()
    hideForms()
    $link = $(this);
    $.ajax($link.attr('href'), {
      success: (data) ->
        $link.closest(".sub-interval-place").children(".new-schedule-event-place").html(data)

    })
    return false
  )

  $("#js-schedules").on('click', ".js-delete-schedule-event", (event)->
    $link = $(this);
    $.ajax($link.attr('href'), {
      type: 'DELETE'
      beforeSent: (xhr) ->
        xhr.setRequestHeader( 'X-CSRF-Token', $("meta[name='csrf-token']" ).attr('content'));
      success: (data) ->
        $link.closest(".schedule_row").html(data)
    })
    return false
  )

  $("#js-schedules").on("submit", ".new-schedule-event-place form", (event)->
    $form = $(this)
    $.ajax($form.prop("action"), {
      type: 'POST',
      data: $form.serialize(),
      success: (data)->
        $form.closest(".schedule_row").html(data)
      error: ->
        console.log("ERROR")
    })
    return false
  )

  $("#js-schedules").on('click', ".js-clear-forms", (event)->
    hideForms()
    return false
  )
)

hideForms = () ->
  $(".new-sub-interval-place").html("")
  $(".new-schedule-event-place").html("")
