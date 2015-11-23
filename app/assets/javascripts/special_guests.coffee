$(document).on "page:change", ->
  $(".js-modal-toggle").on "click", ->
    href = $(this).attr("href")
    $.ajax
      url: href
      dataType: "html"
      method: "GET"
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        $("#js-modal-place").html(data)
        $("#modal_quest").show()
        $("#js-close-modal").on "click", ->
          $("#js-modal-place").html("")
