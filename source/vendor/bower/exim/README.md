# Exim.js [![Build Status](https://travis-ci.org/hellyeahllc/exim.svg)](https://travis-ci.org/hellyeahllc/exim)

[hellyeah.is/exim](http://hellyeah.is/exim/)

An ultra-lightweight Flux-like architecture for HTML5 apps using Facebook's React library.

## Install

`npm install --save exim`

If you're using Bower: `bower install exim`

## Why

Because, we hate complexity. Redux is very complex. Adding Redux to your app won't solve any problem per se — you would need to add tons of Redux plugins.

Exim focuses on three things:

1. Simple actions with unidirectional flow. You cannot change app data from the outside.
2. Easy lifecycle management and optimistic updates. Those are solid requirements for many modern apps.
3. Being a first-class React citizen. Subscribing to data updates or calling an action should never be complex.

```javascript
var User = Exim.createStore({
  fetch: {
    on(name) {
      return request.get('/v1/user/' + name);
    },
    did(response) {
      this.set({currentUser: response});
    },
    while(isFetching) {
      // This allows us to show a spinner.
      this.set({isFetching: isFetching});
    }
  },

  create: {
    on(data) {
      return request.put('/v1/user', data);
    },
    did(userInfo) {
      const list = this.get('users');
      list.push(userInfo);
      this.set({users: list}); // Immutable by default. Need to write updates explicitly.
    },
    didNot(error) {
      // Revert your optimistic updates here.
      console.error('Whoops. Something happened. You can revert some state here. Code:', error);
    }
  }
});

// In your view
React.createClass({
  mixins: [User.connect('isFetching')],
  create() {
    User.actions.create({name: 'Jonny Bravo'});
  },
  render() {
    if (this.isFetching) {
      return <div>Showing a spinner is as simple as that.</div>
    } else {
      return <div onClick={this.create}>Let me create something!</div>
    }
  }
});

```

## Dependencies

The only hard dependency is React.js.

## Changelog

### Exim 0.9.0 (Dec 22, 2015)
* Stores can now use `propTypes` to specify the exact data types of properties.
* Massively improved debugging.

### Exim 0.8.2 (Dec 13, 2015)

* Add React Router 1.0 support.
* Store's `path` argument is optional.

### Exim 0.8.1 (Dec 11, 2015)

* Fix temporary variables for `will` cycle.

### Exim 0.8.0 (Dec 11, 2015)

* `while` and `on` / `did` are now wrapped in transactions — every data `set`
  would be groupped and then executed as one command instead of a few `set`s.
* You can now use `class` as an alias to react's `className` for HTML tags.
* `cx` helper enhancements.
* Performance improvement.

### Exim 0.7.0 (Aug 15, 2015)

* Test release using Freezer.js for immutability.

### Exim 0.6.2 (May 22, 2015)

* Fix action's chain bug.

### Exim 0.6.1 (May 16, 2015)

* Implement **store.reset()** / **store.reset(prop)**.
* Getter: Revert logic. Fix allowed methods bug.
* while[Action]: Fix `didNot` case bug.
* Fix *Unhandled rejection* error.

### Exim 0.6.0 (May 15, 2015)

* Massive reduce in size. Exim is only 4K now (when gzipped).
* Dropped all dependencies. But of course you'll need to include React.
* Massive simplification.
* Rewritten in ES6.

### Exim 0.5.0 (May 6, 2015)

* Implement **Exim.createView**.
* **Exim.Router** enhancements.
* Add **Exim.helpers**.

### Exim 0.4.0 (Dec 9, 2014)

* Initial release.

## License

Exim is currently maintained by Paul Miller and Artem Yavorsky.

The MIT License (MIT)

Copyright (c) 2014 Hellyeah LLC http://hellyeah.is

With contributions by several individuals: https://github.com/hellyeahllc/exim/graphs/contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
