
# translate: {_: 'var1: {var1} var2: {var2}', var1: 1, var2: 2}
# translate: {_: key, var1: 1, var2: 2}
# translate: key

module.exports = (dictionary)->

	format = (template, vars)->
		template.replace /\{([^}]+)\}/g, (key)-> vars[key]

	update: (element, valueAccessor, allBindingsAccessor, viewModel)->
		key = unwrap valueAccessor()

		setTextContent element,
			if 'string' is typeof key
				dictionary[key] ? key
			else
				template = dictionary[key._] ? key._
				format template, key
