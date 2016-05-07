$(document).ready ->
  console.log("~~~~")
  $('#submit').click ->
    console.log("~~~~2")
    title = document.getElementById('book_title').value
    console.log(title)
    if title.length == 0
      alert 'Please input a first name'
    return
  return
