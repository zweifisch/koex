
# dropfiles: observableArray

init: (element, valueAccessor, allBindingsAccessor, viewModel)->
	value = valueAccessor()
	
	ko.utils.registerEventHandler element, 'dragover', (e)->
		e.preventDefault()
		e.stopPropagation()
		
	ko.utils.registerEventHandler element, 'dragleave', (e)->
		e.preventDefault()
		e.stopPropagation()

	ko.utils.registerEventHandler element, 'drop', (e)->
		e.preventDefault()
		e.stopPropagation()
		e = e.originalEvent
		files = e.target.files ? e.dataTransfer.files
		value.push file for file in files
