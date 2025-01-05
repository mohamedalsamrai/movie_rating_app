import 'package:flutter/material.dart';

class Dimens {
  static const double _screenWidthSmallSize = 400;

  static AppDimensions getAppDimens(BuildContext context) {
    double screenWidthSize = MediaQuery.of(context).size.width;

    if (screenWidthSize <= _screenWidthSmallSize) return _SmallSizeDimens();
    return _DefaultDimens();
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < _screenWidthSmallSize;
  }
}

abstract class AppDimensions {
  final double padding6;
  final double padding8;
  final double padding10;
  final double padding14;
  final double padding20;

  final double radius8;
  final double radius10;
  final double radius12;
  final double searchBarRadius;

  final double size10;
  final double size20;
  final double size37;
  final double size52;
  final double size80;

  final double bottomNavigationHeight;
  final double bottomNavigationIconSize;
  final double customButtonHeight;
  final double customTextFieldBorder;
  final double customTextFieldHeight;
  final double movieCarouselMargin;
  final double searchScreenCrossAxisSpacing;
  final double searchScreenImageWidth;
  final double searchScreenMargin;
  final double searchScreenMainAxisSpacing;

  final double fontSize11;
  final double fontSize15;
  final double fontSize18;
  final double fontSize19;
  final double fontSize20;
  final double searchBarFontSize;

  AppDimensions._(
      this.padding6,
      this.padding8,
      this.padding10,
      this.padding14,
      this.padding20,
      this.radius8,
      this.radius10,
      this.radius12,
      this.searchBarRadius,
      this.size10,
      this.size20,
      this.size37,
      this.size52,
      this.size80,
      this.bottomNavigationHeight,
      this.bottomNavigationIconSize,
      this.customButtonHeight,
      this.customTextFieldBorder,
      this.customTextFieldHeight,
      this.movieCarouselMargin,
      this.searchScreenCrossAxisSpacing,
      this.searchScreenImageWidth,
      this.searchScreenMargin,
      this.searchScreenMainAxisSpacing,
      this.fontSize11,
      this.fontSize15,
      this.fontSize18,
      this.fontSize19,
      this.fontSize20,
      this.searchBarFontSize);
}

class _DefaultDimens implements AppDimensions {
  @override
  double get padding6 => 6;

  @override
  double get padding8 => 8;

  @override
  double get padding10 => 10;

  @override
  double get padding14 => 14;

  @override
  double get padding20 => 20;

  @override
  double get radius8 => 8;

  @override
  double get radius10 => 10;

  @override
  double get radius12 => 12;

  @override
  double get searchBarRadius => 50;

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
  double get bottomNavigationHeight => 71;

  @override
  double get bottomNavigationIconSize => 34;

  @override
  double get customButtonHeight => 50;

  @override
  double get customTextFieldBorder => 1.3;

  @override
  double get customTextFieldHeight => 54;

  @override
  double get movieCarouselMargin => 60;

  @override
  double get searchScreenCrossAxisSpacing => 8;

  @override
  double get searchScreenImageWidth => 100;

  @override
  double get searchScreenMargin => 15;

  @override
  double get searchScreenMainAxisSpacing => 20;

  @override
  double get fontSize11 => 11;

  @override
  double get fontSize15 => 15;

  @override
  double get fontSize18 => 18;

  @override
  double get fontSize19 => 19;

  @override
  double get fontSize20 => 20;

  @override
  double get searchBarFontSize => 15.5;
}

class _SmallSizeDimens implements AppDimensions {
  @override
  double get padding6 => 6;

  @override
  double get padding8 => 8;

  @override
  double get padding10 => 10;

  @override
  double get padding14 => 14;

  @override
  double get padding20 => 20;

  @override
  double get radius8 => 8;

  @override
  double get radius10 => 10;

  @override
  double get radius12 => 12;

  @override
  double get searchBarRadius => 50;

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
  double get bottomNavigationHeight => 71;

  @override
  double get bottomNavigationIconSize => 34;

  @override
  double get customButtonHeight => 50;

  @override
  double get customTextFieldBorder => 1.3;

  @override
  double get customTextFieldHeight => 54;

  @override
  double get movieCarouselMargin => 45;

  @override
  double get searchScreenCrossAxisSpacing => 8;

  @override
  double get searchScreenImageWidth => 100;

  @override
  double get searchScreenMargin => 15;

  @override
  double get searchScreenMainAxisSpacing => 20;

  @override
  double get fontSize11 => 11;

  @override
  double get fontSize15 => 15;

  @override
  double get fontSize18 => 18;

  @override
  double get fontSize19 => 19;

  @override
  double get fontSize20 => 20;

  @override
  double get searchBarFontSize => 15.5;
}
