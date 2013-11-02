# date: unix-timestamp

update: (element, valueAccessor)->
	d = new Date unwrap(valueAccessor()) * 1000
	[year, month, date] = [if x < 10 then "0#{x}" else x for x in [d.getFullYear(), d.getMonth() + 1, d.getDate()]]
	element.innserHTML = "#{year}-#{month}-#{date}"
