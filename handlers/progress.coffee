# progress: value [0,1]

update: (element, valueAccessor)->
	value = unwrap valueAccessor()
	element.style.width = "#{Math.round value * 100}%"
