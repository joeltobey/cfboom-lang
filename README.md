[![Build Status](https://api.travis-ci.org/joeltobey/cfboom-lang.svg?branch=development)](https://travis-ci.org/joeltobey/cfboom-lang)

# WELCOME TO THE CFBOOM LANG COLDBOX MODULE
Every object needs some basic goodies.

##LICENSE
Apache License, Version 2.0.

##IMPORTANT LINKS
- https://github.com/joeltobey/cfboom-lang

##SYSTEM REQUIREMENTS
- Lucee 4.5+
- ColdFusion 9+

# INSTRUCTIONS
Just drop into your **modules** folder

# METHODS
Any object that inherits `cfboom.lang.Object` will have these methods for your enjoyment:

```js
var obj = new cfboom.lang.Object();
obj.equals( [any other] );
obj.getIdentityHashCode();
obj.getIdentityString();
obj.getComponentName();
obj.getMeta();
obj.hashCode();
obj.toString();
```