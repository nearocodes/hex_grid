import 'package:hex_grid/hex_grid.dart';
import 'package:test/test.dart';

void main() {
  group('distance', () {
    test('Distance between the same coordinate', () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(0, 0);
      expect(a.distanceTo(b), 0);
    });

    test('Distance between two adjacent coordinates', () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(1, 0);
      expect(a.distanceTo(b), 1);
    });

    test('Distance between two coordinates far away', () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(3, 4);
      expect(a.distanceTo(b), 7);
    });
  });

  group('line', () {
    test('Line between the same coordinate', () {
      const a = CubeHexCoordinate(0, 0);
      expect(HexCoordinate.line(a, a, excludeEdges: false), []);
    });
    test('Line between adjacent coordinates', () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(0, 1);
      expect(HexCoordinate.line(a, b, excludeEdges: false), [a, b]);
    });
    test(
        'Line between coordinates passing edge ending in positive q, negative r, negative s',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(2, -1);
      expect(HexCoordinate.line(a, b, excludeEdges: false),
          [a, const CubeHexCoordinate(1, -1), b]);
    });
    test(
        'Line between coordinates passing edge ending in positive q, negative r, negative s, excluding edges',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(2, -1);
      expect(HexCoordinate.line(a, b, excludeEdges: true), [a, b]);
    });
    test(
        'Line between coordinates passing edge ending in positive q, positive r, negative s',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(1, 1);
      expect(HexCoordinate.line(a, b, excludeEdges: false),
          [a, const CubeHexCoordinate(1, 0), b]);
    });
    test(
        'Line between coordinates passing edge ending in positive q, positive r, negative s, excluding edges',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(1, 1);
      expect(HexCoordinate.line(a, b, excludeEdges: true), [a, b]);
    });
    test(
        'Line between coordinates passing edge ending in negative q, positive r, positive s',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(-2, 1);
      expect(HexCoordinate.line(a, b, excludeEdges: false),
          [a, const CubeHexCoordinate(-1, 1), b]);
    });
    test(
        'Line between coordinates passing edge ending in negative q, positive r, positive s, excluding edges',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(-2, 1);
      expect(HexCoordinate.line(a, b, excludeEdges: true), [a, b]);
    });
    test(
        'Line between coordinates passing two edges ending in positive q, negative r, negative s',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(4, -2);
      expect(HexCoordinate.line(a, b, excludeEdges: false), [
        a,
        const CubeHexCoordinate(1, -1),
        const CubeHexCoordinate(2, -1),
        const CubeHexCoordinate(3, -2),
        b
      ]);
    });
    test(
        'Line between coordinates passing two edges ending in positive q, negative r, negative s, excluding edges',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(4, -2);
      expect(HexCoordinate.line(a, b, excludeEdges: true),
          [a, const CubeHexCoordinate(2, -1), b]);
    });
    test(
        'Line between coordinates passing two edges ending in negative q, positive r, positive s',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(-4, 2);
      expect(HexCoordinate.line(a, b, excludeEdges: false), [
        a,
        const CubeHexCoordinate(-1, 1),
        const CubeHexCoordinate(-2, 1),
        const CubeHexCoordinate(-3, 2),
        b
      ]);
    });
    test(
        'Line between coordinates passing two edges ending in negative q, positive r, positive s, excluding edges',
        () {
      const a = CubeHexCoordinate(0, 0);
      const b = CubeHexCoordinate(-4, 2);
      expect(HexCoordinate.line(a, b, excludeEdges: true),
          [a, const CubeHexCoordinate(-2, 1), b]);
    });
  });
}
