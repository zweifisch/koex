

handlers = (ko)->

	format = (template, vars)->
		template.replace /\{([^}]+)\}/g, (key)-> vars[key]

	{dataFor, unwrap, bindingHandlers, extend} = ko
	{setTextContent, registerEventHandler} = ko.utils

	extend bindingHandlers,

		bignum:
			# bignum: 10000
			update: (el, valueAccessor)->
				el.innerHTML = unwrap(valueAccessor()).toFixed(2).replace /\B(?=(\d{3})+(?!\d))/g, ','

		date:
			# date: unix-timestamp
			update: (element, valueAccessor)->
				d = new Date unwrap(valueAccessor()) * 1000
				[year, month, date] = [if x < 10 then "0#{x}" else x for x in [d.getFullYear(), d.getMonth() + 1, d.getDate()]]
				element.innserHTML = "#{year}-#{month}-#{date}"

		datetime:
			# datetime: unix-timestamp
			update: (element, valueAccessor)->
				d = new Date unwrap(valueAccessor()) * 1000
				[year, month, date, hour, minute, second] = [if x < 10 then "0#{x}" else x for x in [d.getFullYear(), d.getMonth() + 1, d.getDate(), d.getHours(), d.getMinutes(), d.getSeconds()]]
				element.innerHTML = "#{year}-#{month}-#{date} #{hour}:#{minute}:#{second}"

		disabled:
			# disabled: true
			init: (element, valueAccessor)->
				registerEventHandler element, 'click', (e)->
					if e.preventDefault 
						e.preventDefault() 
					else
						e.returnValue = no

		drag:
			# drag: {
			# 		effect: 'move'
			# 		type: 'text/plain
			# }
			init: (element, valueAccessor)->
				opts = unwrap valueAccessor()
				defautls =
					effect: 'move'
					type: 'text/plain'
					data: ''
				opts = extend defautls, opts
				element.draggable = yes
				registerEventHandler element, 'dragstart', (e)->
					e.originalEvent.dataTransfer.setData opts.type, opts.data
					e.originalEvent.dataTransfer.effectAllowed = opts.effect
					value dataFor element

		drop:
			# drop: null
			init: (element, valueAccessor, allBindingsAccessor, viewModel)->
				value = valueAccessor()
				registerEventHandler element, 'dragenter', (event)-> no
				registerEventHandler element, 'dragover', (event)-> no
				registerEventHandler element, 'drop', (event)->
					allBindings = allBindingsAccessor()
					if allBindings.foreach
						allBindings.foreach.push viewModel._draggingItem
						viewModel._draggingItem = null
					else if allBindings.value
						allBindings.value viewModel._draggingItem
						viewModel._draggingItem = null
					no

		dropfiles:
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

		href:
			update: (element, valueAccessor)->
				element.href = unwrap valueAccessor()

		filesize:
			# filesize: size
			update: (element, valueAccessor)->
				value = unwrap valueAccessor()
				units = ['','K','M','G','T']
				unit = 0
				while value > 1024 and unit < units.length - 1
					value = value / 1024
					unit += 1
				element.innerHTML = "#{value.toFixed 2} #{units[unit]}"

		longtext:
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

		progress:
			# progress: value [0,1]
			update: (element, valueAccessor)->
				value = unwrap valueAccessor()
				element.style.width = "#{Math.round value * 100}%"

		src:
			update: (element, valueAccessor)->
				element.src = unwrap valueAccessor()

		stopBindings:
			# stopBindings: true
			init: -> controlsDescendantBindings: yes

		toggle:
			# toggle: observable
			init: (el, valueAccessor)->
				value = valueAccessor()
				registerEventHandler el, 'click', (e)->
					value !value()

		_:
			# _: {key: 'var1: {var1} var2: {var2}', var1: 1, var2: 2}
			# _: {key: key, var1: 1, var2: 2}
			# _: key
			update: (element, valueAccessor, allBindingsAccessor, viewModel)->
				key = unwrap valueAccessor()
				setTextContent element,
					if 'string' is typeof key
						viewModel.lang[key] ? key
					else
						template = viewModel.lang[key.key] ? key.key
						format template, key


if 'object' is typeof ko
	handlers ko
else
	define? -> handlers

