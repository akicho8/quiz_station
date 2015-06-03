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

# AJAX動作確認用
$(document)
  .ajaxStart ->
    $("#spinner").html($.active)
    $("#spinner").show()
  .ajaxStop ->
    if $.active == 0
      $("#spinner").hide()
  .ajaxError (event, XMLHttpRequest, options, thrownError) ->
     alert "#{XMLHttpRequest.status} #{XMLHttpRequest.statusText})"

# 問題をクリックすると答えのコンテンツで上書きする
$(document).on "click", ".panel-body", (e) ->
  panel = $(e.target).parents(".panel") # e.target は .panel-body 自身だったり、.panel-body span だったりするため共通の親の .panel から操作する
  question_answer = panel.find(".question_answer") # .panel .question_answer のコンテンツを panel-body の直下に移す
  panel_body = panel.find(".panel-body")
  panel_body.html(question_answer.html())
  # answered_counter_inc のフォームもついでに submit しておく
  form = panel.find("form")
  form.submit()
  form.remove("form") # 一回だけの submit にしたいので form を消す

# 重要チェックボックスをクリックすると即submitを発行する
# チェックボックスクリック→submitクリックのショートカットに相当する
$(document).on "click", ".edit_article :checkbox", (e) =>
  form = $(e.target).parents("form")
  form.submit()

# $(document).on "click", ".kotae_display", (e) =>
#   e.preventDefault()
#   e.stopPropagation()
#   e.stopImmediatePropagation()
#   answerbody = $(e.target).data("answerbody")
#   $(e.target).html(answerbody)
#   # alert $(e.target).data("answerbody")

