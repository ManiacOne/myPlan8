import 'package:flutter/material.dart';
import 'package:my_plan8/core/constants/colors.dart';
import 'package:my_plan8/core/constants/dimensions.dart';

class TextStyles {
  static textStyles40(context,
      {FontWeight? fWeight, Color? color, double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 38,
        //fontSize: Dimensions.moderateScale(40),
        //fontSize: SizeConfig.isMobilePortrait ? 4.4 * SizeConfig.textMultiplier! : 36,
        fontWeight: fWeight ?? FontWeight.w600,
        height: height ?? Dimensions.verticalScale(1.3),
        color: color ?? AppColors.white);
  }

  static textStyles32(context, FontWeight fWeight, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 32,
        //fontSize: Dimensions.moderateScale(32),
        //fontSize:SizeConfig.isMobilePortrait ? 4 * SizeConfig.textMultiplier! : 32,
        fontWeight: fWeight,
        height: height ?? Dimensions.verticalScale(1.3),
        letterSpacing: 0.32,
        color: color);
  }

  static textStyles28(context, FontWeight fWeight, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 32,
        //fontSize: Dimensions.moderateScale(32),
        //fontSize: SizeConfig.isMobilePortrait ? 3.2 * SizeConfig.textMultiplier! : 28,
        fontWeight: fWeight,
        height: height ?? Dimensions.verticalScale(1.3),
        letterSpacing: 0.32,
        color: color);
  }

  static textStyles20(context, FontWeight fWeight, Color color,
      {double? letterSpacing, double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 18,
        //fontSize: Dimensions.moderateScale(20),
        //fontSize: SizeConfig.isMobilePortrait ? 2.5 * SizeConfig.textMultiplier! : 20,
        fontWeight: fWeight,
        color: color,
        wordSpacing: Dimensions.horizontalScale(1.3),
        height: height ?? Dimensions.verticalScale(1.3),
        letterSpacing: letterSpacing ?? 0.6);
  }

  static textStyles18(
      {FontWeight? fWeight,
      Color? color,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 16,
        //fontSize: Dimensions.moderateScale(18),
        //fontSize:SizeConfig.isMobilePortrait ? 2.2 * SizeConfig.textMultiplier! : 18,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black92,
        wordSpacing: Dimensions.horizontalScale(1.3),
        height: height ?? Dimensions.verticalScale(1.3),
        letterSpacing: letterSpacing ?? 0.6);
  }

  static textStyles16({FontWeight? fWeight, Color? color, double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 14,
        //fontSize: Dimensions.moderateScale(16),
        //fontSize:SizeConfig.isMobilePortrait ? 1.9 * SizeConfig.textMultiplier! : 16,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black92,
        wordSpacing: Dimensions.horizontalScale(1.3),
        height: height ?? Dimensions.verticalScale(1.3));
  }

  static textStyles14({FontWeight? fWeight, Color? color, double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 12,
        //fontSize: Dimensions.moderateScale(14),
        //fontSize: SizeConfig.isMobilePortrait ? 1.7 * SizeConfig.textMultiplier! : 14,
        fontWeight: fWeight ?? FontWeight.w400,
        color: color ?? AppColors.black92,
        wordSpacing: Dimensions.horizontalScale(1.3),
        height: height ?? Dimensions.verticalScale(1.3));
  }

  static textStyles12({FontWeight? fWeight, Color? color, double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 10,
        //fontSize: Dimensions.moderateScale(12),
        //fontSize:SizeConfig.isMobilePortrait ? 1.4 * SizeConfig.textMultiplier! : 12,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black92,
        wordSpacing: Dimensions.horizontalScale(1),
        height: height ?? Dimensions.verticalScale(1.3));
  }

  static textStyles10(context, FontWeight fWeight, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 8,
        //fontSize: Dimensions.moderateScale(10),
        //fontSize:SizeConfig.isMobilePortrait ? 1.1 * SizeConfig.textMultiplier! : 10,
        fontWeight: fWeight,
        color: color,
        height: height ?? Dimensions.verticalScale(1));
  }

  static textStyles8(context,
      {double? height, FontWeight? fWeight, Color? color}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 6,
        //fontSize: Dimensions.moderateScale(8),
        //fontSize: SizeConfig.isMobilePortrait ? 1 * SizeConfig.textMultiplier! : 8,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black92,
        wordSpacing: Dimensions.horizontalScale(1),
        height: height ?? Dimensions.verticalScale(1));
  }

  static textStyles7(context, FontWeight fWeight, Color color,
      {double? height}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 5,
        //fontSize: Dimensions.moderateScale(7),
        //fontSize: SizeConfig.isMobilePortrait ? 0.9 * SizeConfig.textMultiplier! : 7,
        fontWeight: fWeight,
        color: color,
        wordSpacing: Dimensions.horizontalScale(1),
        height: height ?? Dimensions.verticalScale(1));
  }

  /*------------decorated text---------------- */
  static decoratedTextStyles14(context,
      {double? height, FontWeight? fWeight, Color? color}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 12,
        //fontSize: Dimensions.moderateScale(14),
        //fontSize: SizeConfig.isMobilePortrait ? 1.8 * SizeConfig.textMultiplier! : 14,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black166,
        height: height ?? Dimensions.verticalScale(1),
        decoration: TextDecoration.lineThrough);
  }

  static decoratedTextStyles18(context,
      {double? height, Color? color, FontWeight? fWeight}) {
    return TextStyle(
        fontFamily: "ClashDisplay",
        fontSize: 16,
        //fontSize: Dimensions.moderateScale(18),
        //fontSize: SizeConfig.isMobilePortrait ? 2.2 * SizeConfig.textMultiplier! : 18,
        fontWeight: fWeight ?? FontWeight.w500,
        color: color ?? AppColors.black166,
        height: height ?? Dimensions.verticalScale(1),
        decoration: TextDecoration.lineThrough);
  }
}
