class GuestbookBackbone.Views.IndexView extends Backbone.View
  el: 'div#main_content#'

  events:
    'submit form': 'submitEntry'


  initialize: ->
    $.getJSON '/entries.json', ( data ) =>
      for entry in data
        entryView = new GuestbookBackbone.Views.EntryView(model: entry)
        entryView.render()


  # event methods

  submitEntry: ( event ) ->
    event.preventDefault()

    view = @
    $form = $ event.target

    $.post '/entries', $form.serialize(), ( data ) ->
      entryView = new GuestbookBackbone.Views.EntryView(model: data, slow: true)
      entryView.render()

      view.resetForm()
      view.success 'Eintrag gespeichert'


  # helper methods

  success: (message) ->
    jSuccess message,
      autoHide : true
      HorizontalPosition : 'center'
      VerticalPosition : 'top'
      ShowOverlay : false


  resetForm: ->
    ( $ 'form' )[0].reset()



