# simple client side input validation for phone and email formats with CoffeeScript/jQuery
$(document).ready ->
  $('#validate_submit').click (event) ->
    event.preventDefault()
    if $('#book_title').val().length > 0
      $('#submit_book').click()
    else
      $('#err_span').css 'opacity', '1'
