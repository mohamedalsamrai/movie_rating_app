import 'package:flutter/material.dart';

class Dimens {
  static const double _screenWidthSmallSize = 360.0;

  static AppDimensions getAppDimens(BuildContext context) {
    double screenWidthSize = MediaQuery.of(context).size.width;

    if (screenWidthSize <= _screenWidthSmallSize) return _SmallSizeDimens();
    return _DefaultDimens();
  }
}

abstract class AppDimensions {
  final double padding10;
  final double padding14;
  final double padding20;

  final double radius8;

  final double size10;
  final double size20;
  final double size37;
  final double size52;
  final double size80;

  final double customButtonHeight;
  final double customTextFieldHeight;
  final double customTextFieldBorder;

  final double fontSize15;
  final double fontSize18;
  final double fontSize19;

  AppDimensions._(
      this.padding10,
      this.padding14,
      this.padding20,

      this.radius8,

      this.size10,
      this.size20,
      this.size37,
      this.size52,
      this.size80,

      this.customButtonHeight,
      this.customTextFieldHeight,
      this.customTextFieldBorder,

      this.fontSize15,
      this.fontSize18,
      this.fontSize19
  );
}

class _DefaultDimens implements AppDimensions {
  @override
  double get padding10 => 10;

  @override
  double get padding14 => 14;

  @override
  double get padding20 => 20;

  @override
  double get radius8 => 8;

  @override
  double get size10 => 10;

  @override
  double get size20 => 20;

  @override
  double get size37 => 37;

  @override
  double get size52 => 52;

  @override
  double get size80 => 80;

  @override
  double get customButtonHeight => 50;

  @override
  double get customTextFieldHeight => 54;

  @override
  double get customTextFieldBorder => 1.3;

  @override
  double get fontSize15 => 15;

  @override
  double get fontSize18 => 18;

  @override
  double get fontSize19 => 19;
}

class _SmallSizeDimens implements AppDimensions {
  @override
  double get padding10 => 10;

  @override
  double get padding14 => 14;

  @override
  double get padding20 => 20;

  @override
  double get radius8 => 8;

  @override
  double get size10 => 7.5;

  @override
  double get size20 => 15;

  @override
  double get size37 => 27.75;

  @override
  double get size52 => 39;

  @override
  double get size80 => 60;

  @override
  double get customButtonHeight => 50;

  @override
  double get customTextFieldHeight => 54;

  @override
  double get customTextFieldBorder => 1.3;

  @override
  double get fontSize15 => 15;

  @override
  double get fontSize18 => 18;

  @override
  double get fontSize19 => 19;
}
