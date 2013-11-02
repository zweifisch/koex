
# toggle: observable

init: (el, valueAccessor)->
	value = valueAccessor()
	registerEventHandler el, 'click', (e)->
		value !value()
