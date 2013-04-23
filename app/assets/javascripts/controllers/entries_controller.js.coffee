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
    $.ajax
      url: '/entries/new_winner'
      success: (r)=>
        @forEach (e)->
          e.get('content').reload()
      error: (r)->
        console.log r

  allWinners: (->
    @everyProperty('winner')
  ).property('@each.winner')
