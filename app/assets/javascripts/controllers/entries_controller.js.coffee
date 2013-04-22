Raffler.EntriesController = Ember.ArrayController.extend
  itemController: 'entry'
  sortProperties: ['name']
  sortAscending: true
  addEntry: (name) ->
    rec = Raffler.Entry.createRecord(name: name)
    @store.commit()

  removeItem: (obj) ->
    obj.get('content').deleteRecord()
    @store.commit()

  drawWinner: ->
    @setEach('highlight', false)
    pool = @rejectProperty('winner')
    if pool.length > 0
      #TODO make this server side
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.set('winner', true)
      entry.set('highlight', true)
      @store.commit()

  allWinners: (->
    @everyProperty('winner')
  ).property('@each.winner')
