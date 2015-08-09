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
#= require twitter/bootstrap
#= require_tree .

# AJAX動作確認用
$(document)
  .ajaxStart ->
    $("#spinner").html("処理中...")
    $("#spinner").show()
  .ajaxStop ->
    if $.active == 0
      $("#spinner").hide()
  .ajaxError (event, XMLHttpRequest, options, thrownError) ->
     alert "#{XMLHttpRequest.status} (#{XMLHttpRequest.statusText})"

# 問題をクリックすると答えのコンテンツで上書きする
$(document).on "click", ".panel-body", (e) ->
  panel = $(e.target).parents(".panel") # e.target は .panel-body 自身だったり、.panel-body span だったりするため共通の親の .panel から操作する
  v_answer_body = panel.find(".v_answer_body") # .panel .v_answer_body のコンテンツを panel-body の直下に移す
  panel_body = panel.find(".v_question_body")
  panel_body.html(v_answer_body.html())
  # answer_logs_create のフォームもついでに submit しておく
  form = panel.find(".answer_logs_create_form")
  form.submit()
  form.remove() # 一回だけの submit にしたいので form を消す

# 非表示チェックボックスをクリックすると即submitを発行する
# チェックボックスクリック→submitクリックのショートカットに相当する
$(document).on "click", ".mark_update_form :checkbox", (e) =>
  form = $(e.target).parents("form")
  form.submit()
  e.stopImmediatePropagation()  # 問題の領域をクリックしたことになってしまうのをふせぐため。

  # 背景を変更するだけ
  if true
    panel = $(e.target).parents(".panel")
    if form.find("input:checkbox").is(":checked")
      # style = {backgroundColor: "#eee"}
      panel.addClass("panel_checked")
    else
      # style = {backgroundColor: "#fff"}
      # panel.css(style)
      panel.removeClass("panel_checked")

  # 消したい場合
  if false
    if form.find("input:checkbox").is(":checked")
      div = $(e.target).parents(".panel").parents(".row")
      div.remove()
