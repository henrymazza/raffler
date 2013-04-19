Raffler.EntriesController = Ember.ArrayController.extend
  itemController: 'entry'
  sortProperties: ['name']
  sortAscending: true
  addEntry: ->
    @pushObject Ember.Object.create(name: @get('newEntryName'))
    @set("newEntryName", "")

  drawWinner: ->
    @setEach('highlight', false)
    pool = @rejectProperty('winner')
    if pool.length > 0
      #TODO make this server side
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set('winner', true)
      entry.set('highlight', true)

