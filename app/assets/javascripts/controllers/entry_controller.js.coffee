Raffler.EntryController = Ember.ObjectController.extend
  nameLength: (->
    @get('name').length
  ).property('name') # when name changes it recalculates the value
