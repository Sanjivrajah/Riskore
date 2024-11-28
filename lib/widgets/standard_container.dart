import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/styles.dart';

class StandardContainer extends StatelessWidget {
  const StandardContainer({
    super.key,
    required this.width,
    required this.child,
  });

  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.edgeInsets10_20,
      width: width,
      constraints: const BoxConstraints(
        minHeight: 10,
      ), // Height will be based on contents inside
      decoration: BoxDecoration(
        gradient: containerGradient(),
        borderRadius: AppStyles.borderRadiusAllSides16,
      ),

      child: child,
    );
  }
}
