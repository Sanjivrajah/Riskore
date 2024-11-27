import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';

class AppFonts {

  // ---------------------------------LARGEST (36px)--------------------------------------

  // use for auth screens "Login" and "Sign Up" headings.
  static TextStyle largestMediumText = TextStyle(
    fontFamily: "Inter",
    fontSize: 36,
    fontWeight: FontWeight.w500, // Medium
    color: AppColor.white,
    // height: 0,
  );

  static TextStyle largestMediumTextBlack = TextStyle(
    fontFamily: "Inter",
    fontSize: 36,
    fontWeight: FontWeight.w500, // Medium, Black
    color: AppColor.black,
    // height: 0,
  );

  // use for Onboarding Questionnaire screen heading "Hey Ahmad".
  static TextStyle largestLightTextGreen = TextStyle(
    fontFamily: "Inter",
    fontSize: 36,
    fontWeight: FontWeight.w300, // Light, Green
    color: AppColor.green,
    // height: 0,
  );


  // ---------------------------------LARGE (24px)----------------------------------------


  // use for credit risk score dashboard % value
  static TextStyle largeSemiBoldText = TextStyle(
    fontFamily: "Inter",
    fontSize: 24,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColor.white,
    // height: 0,
  );
  // use for screen titles, e.g., Credit Reports, My Account, etc.
  static TextStyle largeExtraLightText = TextStyle(
    fontFamily: "Inter",
    fontSize: 24,
    fontWeight: FontWeight.w200, // Extra Light
    color: AppColor.white,
    // height: 0,
  );


  // ---------------------------------NORMAL (16px)---------------------------------------


  // use for screen titles, e.g., Credit Reports, My Account, etc.
  static TextStyle normalLightText = TextStyle(
    fontFamily: "Inter",
    fontSize: 16,
    fontWeight: FontWeight.w300, // Light
    color: AppColor.white,
    // height: 0,
  );

  // use for questions screen - question number, e.g., "Question 1"
  static TextStyle normalLightTextGreen = TextStyle(
    fontFamily: "Inter",
    fontSize: 16,
    fontWeight: FontWeight.w300, // Light
    color: AppColor.green,
    // height: 0,
  );

  // ---------------------------------SMALL (12px)----------------------------------------


  // use for screen titles, e.g., Credit Reports, My Account, etc.
  static TextStyle smallLightText = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    fontWeight: FontWeight.w300, // Light
    color: AppColor.white,
    // height: 0,
  );
  // use for nav bar
  static TextStyle smallLightTextGreen = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    fontWeight: FontWeight.w300, // Light, Green
    color: AppColor.green,
    // height: 0,
  );
  // use for button text
  static TextStyle smallRegularText = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    fontWeight: FontWeight.w400, // Regular, Black
    color: AppColor.black,
    // height: 0,
  );


  // ---------------------------------EXTRA SMALL (10px)----------------------------------


  // use for subtitles, e.g., 7% p.a. | 5 Years
  static TextStyle extraSmallLightText = TextStyle(
    fontFamily: "Inter",
    fontSize: 10,
    fontWeight: FontWeight.w300, // Light
    color: AppColor.white,
    // height: 0,
  );


  // ---------------------------------SMALLEST (8px)-------------------------------------


  // use for exceptionally small subtitles & captions, e.g., Google One RM100.00 (Upcoming Payment in home screen)
  static TextStyle smallestSemiBoldText = TextStyle(
    fontFamily: "Inter",
    fontSize: 8,
    fontWeight: FontWeight.w600, // Semi-bold
    color: AppColor.white,
    // height: 0,
  );

  static TextStyle smallestLightText = TextStyle(
    fontFamily: "Inter",
    fontSize: 8,
    fontWeight: FontWeight.w300, // Light
    color: AppColor.white,
    // height: 0,
  );
}