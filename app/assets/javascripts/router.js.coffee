Raffler.Router.map () ->
  @route 'entries', path: '/'

Raffler.EntriesRoute = Ember.Route.extend
  setupController: (controller) ->
    controller.set('content', [])
    controller.set('title', 'The Controller Title')
    controller.set('secondsViewed', 0)
  activate: () ->
    this.interval = setInterval(() =>
      viewed = this.get('controller.secondsViewed')
      this.set('controller.secondsViewed', viewed + 1)
    , 1000)
