class GuestbookBackbone.Views.IndexView extends Backbone.View
  el: 'div#main_content#'

  events:
    'submit form': 'submitEntry'


  initialize: ->
    $.getJSON '/entries.json', ( data ) =>
      for entry in data
        @insertEntry entry


  # event methods

  submitEntry: ( event ) ->
    event.preventDefault()

    view = @
    $form = $ event.target

    $.post '/entries', $form.serialize(), ( data ) ->
      $entry = view.insertEntry data
      $entry.hide()
      $entry.slideDown 'slow'

      view.resetForm()
      view.success 'Eintrag gespeichert'


  insertEntry: ( entry ) ->
    e = $ '<article></article>'

    e.addClass "post"
    e.attr 'id', entry.id

    e.append "<h4>Von #{entry.user} &lt;#{entry.email}&gt;</h4>"
    e.append "<p>#{entry.body}</p>"

    ( $ "#posts" ).prepend e
    e


  # helper methods

  success: (message) ->
    jSuccess message,
      autoHide : true
      HorizontalPosition : 'center'
      VerticalPosition : 'top'
      ShowOverlay : false


  resetForm: ->
    ( $ 'form' )[0].reset()



