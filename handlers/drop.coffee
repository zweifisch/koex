
# drop: null

module.exports = ->

	init: (element, valueAccessor, allBindingsAccessor)->

		value = valueAccessor()

		registerEventHandler element, 'dragenter', (event)-> no
		registerEventHandler element, 'dragover', (event)-> no

		registerEventHandler element, 'drop', (event)->

			allBindings = allBindingsAccessor()

			if allBindings.foreach
				allBindings.foreach.push global.draggingItem
				global.draggingItem = null
			else if allBindings.value
				allBindings.value global.draggingItem
				global.draggingItem = null
			no
