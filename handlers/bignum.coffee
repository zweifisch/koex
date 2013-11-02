
# bignum: 10000

update: (el, valueAccessor)->
	el.innerHTML = unwrap(valueAccessor()).toFixed(2).replace /\B(?=(\d{3})+(?!\d))/g, ','
