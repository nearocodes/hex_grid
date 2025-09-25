Coordinate system for hexagonal grids.

## Features

- Representation of hexagonal grids using axial and cube coordinates.
- Conversion between axial and cube coordinates.
- Calculation of distances between hexagonal grid points.
- Neighboring hexagon retrieval.

## Getting started

To use this package, add it as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  hex_grid: ^1.0.0
```

## Usage

Import the package in your Dart file:

```dart
import 'package:hex_grid/hex_grid.dart';
```                     
Then, you can create hexagonal grid points and perform various operations:

```dart
   final a = AxialCoordinate(1, 2);
   final c = a.toCube();
```
