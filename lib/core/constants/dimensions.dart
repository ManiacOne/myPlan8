
import 'package:flutter/material.dart';

class Dimensions {
  
  static const double guidelineBaseWidth = 375;
  static const double guidelineBaseHeight = 812;

  static MediaQueryData? _mediaQueryData;
  static double screenHeight = 0;
  static double screenWidth = 0;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWidth = _mediaQueryData!.size.width;
    orientation = _mediaQueryData!.orientation;
  }

  static double horizontalScale(double size) {
    double screenWidth = Dimensions.screenWidth;
    return (screenWidth / guidelineBaseWidth) * size;
  }

  static double verticalScale(double size) {
    double screenHeight = Dimensions.screenHeight;
    return (screenHeight / guidelineBaseHeight) * size;
  }

  /// Calculates the font size scale factor based on the guideline base width.
  ///
  /// Use this function to scale font sizes with an optional `factor` for fine-tuning.
  static double moderateScale(double size, {double factor = 0.1}) {
    return size + (horizontalScale(size) - size) * factor;
  }
}
