
(target, delay)->
	initialValue = target()
	timerId = null
	target.subscribe (value)->
		if timerId then clearTimeout timerId
		if value isnt initialValue
			timerId = setTimeout (-> target initial), delay

