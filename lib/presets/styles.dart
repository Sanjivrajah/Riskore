import 'package:flutter/material.dart';

class AppStyles {
  // BORDER RADIUS

  // -----------------------------------------------------------------------------------


  // Fully Rounded, e.g., buttons, circles, filter dropdown
  static const BorderRadius borderRadiusFullyRounded = BorderRadius.all(
    Radius.circular(999),
  );


  // -----------------------------------------------------------------------------------


  // Standard All-Sides Radius - Use for normal containers
  static const BorderRadius borderRadiusAllSides16 = BorderRadius.all(
    Radius.circular(16),
  );


  // -----------------------------------------------------------------------------------


  // Use for Credit Reports Screen (Container for monthly report in stack)
  static const BorderRadius borderRadiusTop30 = BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );

  // Use for Credit Reports Screen (Container for credit report generator)
  static const BorderRadius borderRadiusAllSides30 = BorderRadius.all(
    Radius.circular(30),
  );


  // -----------------------------------------------------------------------------------
  // MARGIN AND PADDING 

  // 20PX ON LEFT AND RIGHT - IN ALL SCREENS.
  static const EdgeInsets edgeInsetsLR_20 = EdgeInsets.only(left: 20, right: 20);

  // 10PX PADDING ON ALL SIDES - IN ALL BUTTONS / DROPDOWNS / SLIDER 
  static const EdgeInsets edgeInsetsAll_10 = EdgeInsets.all(10);

  
}
