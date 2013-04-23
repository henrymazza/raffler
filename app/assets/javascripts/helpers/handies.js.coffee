Ember.Handlebars.registerBoundHelper 'pluralize', (number, options) ->
    result = if number < 2
      options.hash.single
    else
      if options.hash.plural
        options.hash.plural
      else
        options.hash.single + 's'

    result.replace(/##/g, number)

Ember.Handlebars.registerBoundHelper 'capitalize', (value) ->
  value.toUpperCase()

Ember.Handlebars.registerBoundHelper 'date', (date) ->
  moment.lang('pt-br', I18N['pt-br'])
  moment(date).fromNow()
