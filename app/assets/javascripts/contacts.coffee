# simple client side input validation for phone and email formats with CoffeeScript/jQuery
$(document).ready ->
  $('#validate_submit_2').click (event) ->
    event.preventDefault()
    console.log("~~~~~~~~~~")
    if $('#contact_first_name').val().length > 0 && $('#contact_last_name').val().length > 0 && $('#contact_phone_numbers').val().length > 0 && $('#contact_email_addresses').val().length > 0
      $('#submit_book').click()
    else
      $('#err_span').css 'opacity', '1'

