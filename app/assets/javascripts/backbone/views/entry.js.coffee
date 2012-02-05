class GuestbookBackbone.Views.EntryView extends Backbone.View
  el: 'div#posts#'

  template: JST['backbone/templates/entry']

  render: =>
    $content = $ @template( entry: @model.toJSON() )
    $(@el).prepend $content

    if @options.slow
      $content.hide()
      $content.slideDown 'slow'

    @


