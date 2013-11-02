
# datetime: unix-timestamp

update: (element, valueAccessor)->
	d = new Date unwrap(valueAccessor()) * 1000
	[year, month, date, hour, minute, second] = [if x < 10 then "0#{x}" else x for x in [d.getFullYear(), d.getMonth() + 1, d.getDate(), d.getHours(), d.getMinutes(), d.getSeconds()]]
	element.innerHTML = "#{year}-#{month}-#{date} #{hour}:#{minute}:#{second}"
