# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

redBorder = $('.message-box').css('border', '2px solid red')
$('#submit-button').on 'click', ->
  comment = $('.message-box').val()
  formName = $('.name-box').val()
  formEmail = $('.email-box').val()
  if comment == ''
    redBorder.show()
  else
  return

$('.message-box').keypress ->
  redBorder.hide()
  return