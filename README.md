
# knockout handlers

knockout custom bindings

* href
* src
* drag
* drop
* bignum
* longtext
* dropfiles
* filesize
* progress
* date
* datetime
* toggle
* stopBinding
* disabled

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
