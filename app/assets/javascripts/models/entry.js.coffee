Raffler.Entry = DS.Model.extend
  name: DS.attr('string')
  winner: DS.attr('boolean')
  created_at: DS.attr('date', {readOnly: true})


