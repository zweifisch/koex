
# drag: {
# 		effect: 'move'
# 		type: 'text/plain
# }

module.exports = ->

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
