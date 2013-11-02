
var register = function(ko) {

	handers = [
		'bignum',
		'date',
		'datetime',
		'disabled',
		'drag',
		'drop',
		'dropfiles',
		'filesize',
		'longtext',
		'progress',
		'stopBindings',
		'toggle',
		'translate'
	];

	ko.bindingHandlers[name] = handlers[name]
}

if ('object' == typeof ko) {
	register(ko);
} else {
	define(function(){
		return register;
	})
}

});
