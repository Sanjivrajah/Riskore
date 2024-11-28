import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:sizer/sizer.dart';

class AppFonts {
  // equivalent to Figma 36 - Light, Green
  static TextStyle largestExtraLightTextGreen(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 22.sp,
      fontWeight: FontWeight.w200,
      color: AppColor.green,
    );
  }

  // equivalent to Figma 36 - Medium
  static TextStyle largestLightTextGreen(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 22.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.green,
    );
  }

  // equivalent to Figma 20 - Regular
  static TextStyle largeRegularText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.white,
    );
  }

  // equivalent to Figma 20 - Extra Light
  static TextStyle largeExtraLightText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 20.sp,
      fontWeight: FontWeight.w200,
      color: AppColor.white,
    );
  }

// equivalent to Figma 16 - Light
  static TextStyle normalLightText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColor.white,
    );
  }

  // equivalent to Figma 16 - Light, Green
  static TextStyle normalLightTextGreen(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      color: AppColor.green,
    );
  }

  // equivalent to Figma 16 - Medium, Black (Use for big buttons)
  static TextStyle normalLightTextBlack(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
    );
  }

  // equivalent to Figma 10 - Light
  static TextStyle smallLightText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      color: AppColor.white,
    );
  }

  // equivalent to Figma 10 - Light, Green
  static TextStyle smallLightTextGreen(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      color: AppColor.green,
    );
  }

  // equivalent to Figma 10 - Regular (Use for small buttons)
  static TextStyle smallRegularTextBlack(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.black,
    );
  }

  // equivalent to Figma 10 - Regular (Use for profile container)
  static TextStyle smallRegularText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColor.white,
    );
  }

  // equivalent to Figma 8 - Light
  static TextStyle extraSmallLightText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: AppColor.white,
    );
  }

  // equivalent to Figma 8 - Semi Bold
  static TextStyle extraSmallSemiBoldText(BuildContext context) {
    return TextStyle(
      fontFamily: "Inter",
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: AppColor.white,
    );
  }
}
