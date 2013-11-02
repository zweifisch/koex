
should = chai.should()
mocha.setup 'bdd'

{observable, computed} = ko

model =
	bignum: observable 0
	timestamp: observable 1383372139
	url: observable ''
	size: observable 0

ko.applyBindings model, document.getElementById 'view'

describe 'bignum', ->

	it 'should tame crazy javascript numbers', ->
		document.getElementById('bignum').innerHTML.should.equal '0.00'
		model.bignum 1000
		document.getElementById('bignum').innerHTML.should.equal '1,000.00'
		model.bignum 10000000 / 3
		document.getElementById('bignum').innerHTML.should.equal '3,333,333.33'
		model.bignum 1 / 0
		document.getElementById('bignum').innerHTML.should.equal 'Infinity'

describe 'date', ->

	it 'should convert timestamp into humanreadable date', ->
		document.getElementById('date').innerHTML.should.equal '2013-11-02'

describe 'datetime', ->

	it 'should convert timestamp into humanreadable datetime', ->
		document.getElementById('datetime').innerHTML.should.equal '2013-11-02 14:02:19'

describe 'href', ->

	it 'should set the href of the anchor', ->
		model.url 'http://knockoutjs.com/'
		document.getElementById('href').href.should.equal 'http://knockoutjs.com/'

describe 'filesize', ->

	it 'should turn file size in bytes into humanreadable format', ->
		model.size 10
		document.getElementById('filesize').innerHTML.should.equal '10'
		model.size 10240
		document.getElementById('filesize').innerHTML.should.equal '10.00 K'
		model.size 1024 * 1024 * 1024
		document.getElementById('filesize').innerHTML.should.equal '1.00 G'
