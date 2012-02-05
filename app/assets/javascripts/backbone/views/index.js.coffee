class GuestbookBackbone.Views.IndexView extends Backbone.View
  el: 'div#main_content#'

  events:
    'submit form': 'submitEntry'


  initialize: ->
    @collection = new GuestbookBackbone.Collections.EntriesCollection

    @collection.bind 'reset', @render, @
    @collection.bind 'add', @addEntry, @

    @collection.fetch()


  # event methods

  submitEntry: ( event ) ->
    event.preventDefault()
    $form = $ 'form'

    @collection.create
      user: $form.find( '#entry_user' ).val()
      email: $form.find( '#entry_email' ).val()
      homepage: $form.find( '#entry_homepage' ).val()
      body: $form.find( '#entry_body' ).val()


  # helper methods

  success: (message) ->
    jSuccess message,
      autoHide : true
      HorizontalPosition : 'center'
      VerticalPosition : 'top'
      ShowOverlay : false


  resetForm: ->
    ( $ 'form' )[0].reset()


  render: ->
    ( $ 'div#posts' ).empty()
    for entry in @collection.models
      entryView = new GuestbookBackbone.Views.EntryView(model: entry)
      entryView.render()


  addEntry: ( entry ) ->
    entryView = new GuestbookBackbone.Views.EntryView(model: entry, slow: true)
    entryView.render()

    @resetForm()
    @success 'Eintrag gespeichert'
