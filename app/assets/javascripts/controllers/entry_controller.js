Raffler.EntryController = Ember.ObjectController.extend({
  nameLength: function() {
    return this.get('name').length;
  }.property('name')
});
