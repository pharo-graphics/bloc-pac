# Bloc Pac

[![License](https://img.shields.io/github/license/pharo-graphics/bloc-pac.svg)](./LICENSE)
[![Tests](https://github.com/pharo-graphics/bloc-pac/actions/workflows/test.yml/badge.svg)](https://github.com/pharo-graphics/bloc-pac/actions/workflows/test.yml)

Bloc Pac is a suite of libraries and components to help developers create UI with Bloc.

:warning:
This repository contains the code for Bloc-Pac that may be included in the future in Pharo.
It retrofits a part of the development made at https://github.com/feenkcom/bloc-pac. 
This version will focus on core features and stability.
We are currently identifying the core we want for Pharo.


## Components

- Focus Finder: Allows users to find the next or the previous focusable element in a given direction relative to an element or an area.
- Infinite Element: Allows users to create practically infinite scrollable elements such as for example a vertical scrollable list.
- Element Query: Allows users to query a scene graph of elements in an XPath-like way.

## Element Query Examples

Find deeply all children of elements that are instances of `BrButton`, and return the second one:
```smalltalk
element query // BrButton @ 2
```

Find elements with `#label` id within the first direct child of type `BrButton`:
```smalltalk
element query / BrButton @ 1 // #label
```

## Installation

Use the following script to installs the project in a [Pharo 11](https://pharo.org/download):

```smalltalk
[ Metacello new
	baseline: 'BlocPac';
	repository: 'github://pharo-graphics/bloc-pac:dev-1.0/src';
	onConflictUseIncoming;
	ignoreImage;
	load ]
		on: MCMergeOrLoadWarning
		do: [ :warning | warning load ]
```

## License

This code is licensed under the [MIT license](./LICENSE).
