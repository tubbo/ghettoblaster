jQuery ->
  # Open the "Thanks" page in the same pane.
  $('#new_subscriber_form').on 'ajax:success', (event, response) ->
    $('#canvas').html response
