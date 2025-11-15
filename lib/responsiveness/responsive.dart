import 'dart:developer' as dev;
import 'dart:math';
import 'dart:ui';

abstract class Responsive {
  static const _minFactor = 0.8;
  static const _maxMobileFactor = 1.2;
  static const _maxTabletFactor = 1.5;
  static const _mockupSize = Size(390, 844);

  static Size? _size;
  static Size? get deviceSize => _size;
  static double _widthFactor = 1;
  static double _heightFactor = 1;
  static double? _pixelRatio;

  static Size? get sizeDevice => _size!;
  static Size? get sizeDeviceWithPixelRatio =>
      Size(_size!.width * _pixelRatio!, _size!.height * _pixelRatio!);

  static void defineSize(Size size, {required double pixelRatio}) {
    if (_size == size) return;

    _size = size;
    _pixelRatio = pixelRatio;
    _defineWidthFactor();
    dev.log(_widthFactor.toString(), name: "Width Factor: ");
    _defineHeightFactor();

    dev.log(_heightFactor.toString(), name: "Height Factor: ");
  }

  static void _defineWidthFactor() {
    final calculatedFactor = _size!.width / _mockupSize.width;
    dev.log(_size!.width.toString(), name: "Width: ");

    var factor = max(calculatedFactor, _minFactor);
    if (_size!.width > 700) {
      factor = min(factor, _maxTabletFactor);
    } else {
      factor = min(factor, _maxMobileFactor);
    }

    _widthFactor = factor;
  }

  static void _defineHeightFactor() {
    final calculatedFactor = _size!.height / _mockupSize.height;
    dev.log(_size!.height.toString(), name: "Height: ");

    var factor = max(calculatedFactor, _minFactor);
    if (_size!.height > 1366) {
      factor = min(factor, _maxTabletFactor);
    } else {
      factor = min(factor, _maxMobileFactor);
    }

    _heightFactor = factor;
  }

  static double getSizeValue(double value) => value * _heightFactor;

  static double getFontValue(double value) => value * _widthFactor;
}
