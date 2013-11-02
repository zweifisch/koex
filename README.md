
# knockout handlers

knockout custom bindings

* href
* src
* drop
* number
* number {value: value, digit: 2}
* bignum
* bignum {value: value, digit: 2}
* longtext
* filesize
* progress
* date
* datetime
* translate {src: value, dic: value}

## install

good old way:

```
<script href="ko.js"></script>
<script href="knockout-handlers.js"></script>
```

AMD way:

```
require(['konockout', knockout-handlers.js'], function(ko, kohs){
	kohs(ko);
});
```

## build

```
npm install -g grunt-cli
npm install
grunt build
```
