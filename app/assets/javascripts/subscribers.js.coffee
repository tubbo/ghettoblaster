jQuery ->
  # Open the "Thanks" page in the same pane.
  $('#new_subscriber').on 'ajax:success', (event, response) ->
    history.pushState null, null, '/thanks'
    $('#canvas').html response
