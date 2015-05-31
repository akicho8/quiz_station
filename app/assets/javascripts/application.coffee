# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#  require turbolinks
#= require bootstrap.min
#= require_tree .

$(document).on "click", ".kotae_display", (e) =>
  e.preventDefault()
  e.stopPropagation()
  e.stopImmediatePropagation()
  $(e.target).replace_html
  answerbody = $(e.target).data("answerbody")
  $(e.target).html(answerbody)
  # alert $(e.target).data("answerbody")

$(document).on "click", ".edit_mission :checkbox", (e) =>
  form = $(e.target).parents("form")
  form.submit()
  # e.preventDefault()
  # $.ajax
  #   url: form.attr('action')
  #   type: form.attr('method')
  #   data: form.serialize()
  # alert $(e.target).parents("form").serialize()
  # $(e.target).parents("form").submit()

$(document)
  .ajaxStart ->
    $("#spinner").html($.active)
    $("#spinner").show()
  .ajaxStop ->
    if $.active == 0
      $("#spinner").hide()
  .ajaxError (event, XMLHttpRequest, options, thrownError) ->
     alert "#{XMLHttpRequest.status} #{XMLHttpRequest.statusText})"
