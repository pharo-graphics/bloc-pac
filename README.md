# Bloc Pac

[![Tests](https://github.com/pharo-graphics/bloc-pac/actions/workflows/test.yml/badge.svg)](https://github.com/pharo-graphics/bloc-pac/actions/workflows/test.yml)

Bloc Pac is a suite of libraries and components to help developers create UI with Bloc.

:warning:
This repository contains the code for Bloc-Pac that may be included in the future in Pharo.
It retrofits a part of the development made at https://github.com/feenkcom/bloc-pac. 
This version will focus on core features and stability.
We are currently identifying the core we want for Pharo.


## Components
- [Focus Finder](Focus-Finder.md) - to find focusable elements.
- [Infinite Element](Infinite.md) - to create practically infinitly scrollable elements
- [Element Query](Element-Query.md) - to query elements tree in an XPath fashion 

## Installation

Use the following script to installs the project in a [Pharo 9 or 10](https://pharo.org/download):

```smalltalk
Metacello new
        baseline: 'NewBlocPac';
        repository: 'github://pharo-graphics/bloc-pac/src';
        load.
```

## License

This code is licensed under the [MIT license](./LICENSE).
