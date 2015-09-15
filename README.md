# aligner package [![Build Status](https://img.shields.io/travis/adrianlee44/atom-aligner/master.svg?style=flat-square)](https://travis-ci.org/adrianlee44/atom-aligner)

Easily align multi-line with support for different operators and custom configurations

Mac: `ctrl-cmd-/` Linux/Windows: `ctrl-alt-/`

![aligner](https://raw.github.com/adrianlee44/atom-aligner/master/demo.gif)

### Custom configuration
Package allows user to change the way characters are aligned.
- Pad either left or right of character
- If an extra whitespace should be added to the left and/or right of the character

##### Supported Languages
- Javascript
- Coffeescript
- Ruby ([aligner-ruby](https://github.com/adrianlee44/atom-aligner-ruby))
- CSS & LESS ([aligner-css](https://github.com/adrianlee44/atom-aligner-css))
- SASS & SCSS ([aligner-scss](https://github.com/adrianlee44/atom-aligner-scss))
- PHP ([aligner-php](https://github.com/adrianlee44/atom-aligner-php))
- Python ([aligner-python](https://github.com/adrianlee44/atom-aligner-python))
- For documentation to create aligner add-ons, check this  [page](https://github.com/adrianlee44/atom-aligner/wiki/Creating-aligner-add-ons)

User can either align like this,
```coffeescript
random =
  troll: "internet"
  foo:   "bar"
  bar:   "beer"
```
or this,
```coffeescript
random =
  troll : "internet"
  foo   : "bar"
  bar   : "beer"
```
For more information, visit [wiki](https://github.com/adrianlee44/atom-aligner/wiki/User-configurations)

### Supported character/operator
- `=`: assignment
```coffeescript
foo   = "bar"
test  = "notest"
hello = "world"
```
- `+=`, `-=` and other with `=`
```coffeescript
foo    = "bar"
test  += "notest"
hello -= "world"
```
- `:`: Object
```coffeescript
random =
  troll: "internet"
  foo:   "bar"
  bar:   "beer"
```
- `,`: Items in arrays
```coffeescript
["helloText", 123456, "world"]
["foo"      ,  32124, "bar"]
```

## Changelog
### v0.16.1 (2015-09-14)
- Fix aligner breaking when updating package

### v0.16.0 (2015-09-13)
- Add support for multiple selections alignment
  - Selection blocks will be aligned with the same offset
  - Cursors will be aligned with all adjacent lines with same indentation
- Fix aligner addon packages not working on first call
- Lines with same indentation separated by comments are now considered as the same block
- Add `enabled` option to aligner addon packages

Check [changelog](https://github.com/adrianlee44/atom-aligner/blob/master/CHANGELOG.md) for more information
