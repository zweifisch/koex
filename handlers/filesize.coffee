# filesize: size

update: (element, valueAccessor)->
	value = unwrap valueAccessor()
	units = ['','K','M','G','T']
	unit = 0
	while value > 1024 and unit < units.length - 1
		value = value / 1024
		unit += 1
	element.innerHTML = "#{value.toFixed 2} #{units[unit]}"
