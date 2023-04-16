// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum DeviceType {
  MobileXS,
  MobileS,
  MobileL,
  MobileXL,
  Mobile,
  Tablet,
}

class DeviceSize {
  static double? _currentWidth;
  static double? _currentHeight;
  static double? _initialWidth;
  static double? _initialHeight;
  static Orientation? _orientation;
  static DeviceType? _deviceType;
  static bool? _isPortrait;

  void init(BoxConstraints constraints, Orientation orientation) {
    _orientation = orientation;
    if (orientation == Orientation.portrait) {
      _initialWidth = constraints.maxWidth;
      _initialHeight = constraints.maxHeight;
    } else {
      _initialWidth = constraints.maxHeight;
      _initialHeight = constraints.maxWidth;
    }
    _currentWidth = constraints.maxWidth;
    _currentHeight = constraints.maxHeight;

    //for mobile and tablet screen
    if (_initialWidth! < 600) {
      if (_initialHeight! < 569) {
        _deviceType = DeviceType.MobileXS;
      } else if (_initialHeight! <= 667) {
        _deviceType = DeviceType.MobileS;
      } else if (_initialHeight! <= 736) {
        _deviceType = DeviceType.MobileL;
      } else {
        _deviceType = DeviceType.MobileXL;
      }
    } else {
      _deviceType = DeviceType.Tablet;
    }
  }

  static xtraSmallDevice() {
    //height <= 560
    if (_deviceType == DeviceType.MobileXS) {
      return true;
    }
    return false;
  }

  static smallDevice() {
    //height <= 667
    if (_deviceType == DeviceType.MobileS) {
      return true;
    }
    return false;
  }

  static largeDevice() {
    //height <= 736
    if (_deviceType == DeviceType.MobileL) {
      return true;
    }
    return false;
  }

  static xtraLargeDevice() {
    //height > 812
    if (_deviceType == DeviceType.MobileXL) {
      return true;
    }
    return false;
  }

  static tablet() {
    //width > 600
    if (_deviceType == DeviceType.Tablet) {
      return true;
    }
    return false;
  }

  // screenHeight * input /100; - current height depending on orientation
  static currentHeight(var i) {
    return _currentHeight! * i / 100;
  }

  // screenWidth * input /100; - current width depending on orientation
  static currentWidth(var i) {
    return _currentWidth! * i / 100;
  }

  // screenHeight * input /100; - initial height on portrait orientation
  static initialHeight(var i) {
    return _initialHeight! * i / 100;
  }

  // screenWidth * input /100; - initial width on portrait orientation
  static initialWidth(var i) {
    return _initialWidth! * i / 100;
  }

  // screenWidth * input /1000;
  static sp(var i) {
    if (_deviceType == DeviceType.Tablet) {
      return _initialWidth! / 100 * (i / 4.5);
    }
    return _initialWidth! / 100 * (i / 3);
  }

  static checkOrientation() {
    if (_orientation == Orientation.landscape) {
      _isPortrait = false;
    } else {
      _isPortrait = true;
    }

    return _isPortrait;
  }

  static get orientation => _orientation;
  static get deviceType => _deviceType;
  static get initialW => _initialWidth;
  static get currentW => _currentWidth;
  static get initialH => _initialHeight;
  static get currentH => _currentHeight;
  static get isPortrait => checkOrientation();
}

extension DeviceSizeExt on double {
  //[ex 20.0.h] - current height depending on orientation
  double get ch => DeviceSize.currentHeight(this);

  //[ex 10.0.h]- current width depending on orientation
  double get cw => DeviceSize.currentWidth(this);
  //[ex 20.0.h] - initial height on portrait orientation
  double get ih => DeviceSize.initialHeight(this);

  //[ex 10.0.h]- initial width on portrait orientation
  double get iw => DeviceSize.initialWidth(this);

  //[ex 5.0.sp]
  double get sp => DeviceSize.sp(this);
}
