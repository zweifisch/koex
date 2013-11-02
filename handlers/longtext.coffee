
# longtext: string

update: (element, valueAccessor)->
	text = unwrap valueAccessor()
	element.innerHTML = text
		.replace(/&/g, "&amp;")
		.replace(/</g, "&lt;")
		.replace(/>/g, "&gt;")
		.replace(/"/g, "&quot;")
		.replace(/'/g, "&#039;")
		.replace(/\n/g, "<br/>")
