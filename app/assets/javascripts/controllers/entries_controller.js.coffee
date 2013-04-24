Raffler.EntriesController = Ember.ArrayController.extend
  itemController: 'entry'
  sortProperties: ['winner']
  sortAscending: false
  addEntry: (name) ->
    entry = Raffler.Entry.createRecord(name: name)
    entry.on('becameInvalid', (e)->
      alert('Erro: name ' + entry.errors['name'][0])
      entry.deleteRecord()
    )
    @store.commit()

  removeItem: (obj) ->
    obj.deleteRecord()
    @store.commit()

  drawWinner: ->
    $.ajax
      url: '/entries/new_winner'
      success: (r)=>
        # If returns only only one entry reload it's contents
        # from the response. It should be the winner entry.
        if r.entry?
          @get('store').load(Raffler.Entry, r['entry'])
        # If returns more than one entry reload all of them. It
        # should mean there's no one left to win and there were a reset,
        # but it can be used otherwise.
        else
          for entry in r.entries
            @store.load(Raffler.Entry, entry)
