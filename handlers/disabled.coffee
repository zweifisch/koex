
# disabled: true

init: (element, valueAccessor)->
	registerEventHandler element, 'click', (e)->
		if e.preventDefault 
			e.preventDefault() 
		else
			e.returnValue = no

