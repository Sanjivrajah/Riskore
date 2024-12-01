import 'package:flutter/material.dart';

class AppColor {
  // primary app colors
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffFFFFFF);
  static Color green = const Color(0xff73E491);
  static Color red = const Color(0xffFF787A);

  // to use for representing app colors in pie charts (Refer to Figma)
  static Color cimbBankColor = const Color(0xffF8333A);
  static Color hlBankColor = const Color(0xffFF787A);
  static Color maybankColor = const Color(0xffFACC15);
  static Color publicBankColor = const Color(0xffAE2525);
  static Color ocbcBankColor = const Color(0xffF12312);

  static Color grabPayColor = const Color.fromARGB(255, 53, 222, 129);
  static Color bigPayColor = const Color(0xff53C5D8);
  static Color shopeePayColor = const Color.fromARGB(255, 242, 112, 76);
  static Color tnGoColor = const Color(0xff005ABE);
}

// Use for all containers. Wrap with Opacity widget if need to change transparency.
LinearGradient containerGradient() {
  return LinearGradient(
    colors: [
      const Color(0xff898989).withOpacity(0.35),
      const Color(0xff343434).withOpacity(0.35),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Use for Splash Screen
LinearGradient splashScreenGradient() {
  return LinearGradient(
    colors: [
      const Color(0xffFFFFFF).withOpacity(0.5),
      const Color(0xff94FCC5).withOpacity(0.5),
      const Color(0xff13FFC8).withOpacity(0.5)
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Use for Credit Risk score on home screen
LinearGradient redToGreenGradient() {
  return const LinearGradient(
    colors: [
      Color(0xffFF787A),
      Color(0xff73E491),
    ],
  );
}

// Use for Nav Bar
LinearGradient navBarGradient() {
  return LinearGradient(
    colors: [
      const Color.fromARGB(255, 12, 12, 12).withOpacity(0.6),
      const Color.fromARGB(255, 47, 47, 47).withOpacity(0.6),
      const Color.fromARGB(255, 60, 60, 60).withOpacity(0.6),
      const Color.fromARGB(255, 80, 80, 80).withOpacity(0.6),
      const Color.fromARGB(255, 134, 134, 134).withOpacity(0.4),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Use for all screens background except splash, and questions screens. (Refer to Figma)
LinearGradient backgroundGlowGradient() {
  return LinearGradient(
    colors: [
      const Color(0xff5FD7A7).withOpacity(0.5),
      const Color(0xff2D5057).withOpacity(0.5),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
