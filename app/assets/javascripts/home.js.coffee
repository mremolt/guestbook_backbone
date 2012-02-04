insertEntry = (entry) ->
  e = $ '<article></article>'

  e.addClass "post"
  e.attr 'id', entry.id

  e.append "<h4>Von #{entry.user} &lt;#{entry.email}&gt;</h4>"
  e.append "<p>#{entry.body}</p>"

  ( $ "#posts" ).prepend e
  e

jQuery ( $ ) ->

  $.getJSON '/entries.json', (data) ->
    for entry in data
      insertEntry(entry)


  ( $ 'form' ).submit (event) ->
    event.preventDefault()

    $form = $ event.target

    $.post '/entries', $form.serialize(), (data) ->
      $entry = insertEntry data
      $entry.hide()
      $entry.slideDown 'slow'

      $form[0].reset()

      jSuccess 'Eintrag gespeichert',
        autoHide : true
        HorizontalPosition : 'center'
        VerticalPosition : 'top'
        ShowOverlay : false
