# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  if $('#job_post_has_event_false').prop('checked')
    disable_event(true)

  $('#job_post_has_event_true').on "change", ->
    disable_event(!$('#job_post_has_event_true').prop('checked'))
  $('#job_post_has_event_false').on "change", ->
    disable_event($('#job_post_has_event_false').prop('checked'))

disable_event = (disable) ->
  $('#event_date_selector').children().prop("disabled", disable)
  $('#job_post_event_venue').prop("disabled", disable)


$(document).ready(ready)
$(document).on('page:load', ready)
