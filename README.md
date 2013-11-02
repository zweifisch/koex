
# koex

knockout extensions: custom bindings and extenders

## handlers

* href
* src
* bignum
* filesize
* date
* datetime

TBD

* toggle
* stopBinding
* disabled
* dropfiles
* drag
* drop
* longtext

## extenders

TBD

## install

the good old way:

```
<script href="ko.js"></script>
<script href="koex.js"></script>
```

the AMD way:

```
require(['konockout', 'koex.js'], function(ko, koex){
	koex(ko);
});
```
