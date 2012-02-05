class GuestbookBackbone.Models.Entry extends Backbone.Model
  paramRoot: 'entry'

  defaults:
    user: null
    email: null
    homepage: null
    body: null


class GuestbookBackbone.Collections.EntriesCollection extends Backbone.Collection
  model: GuestbookBackbone.Models.Entry
  url: '/entries'

