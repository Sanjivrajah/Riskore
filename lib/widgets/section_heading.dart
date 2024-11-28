import 'package:flutter/material.dart';
import 'package:riskore/presets/fonts.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.sizeOf(context).width,
      child: Text(
        text,
        style: AppFonts.normalLightText(context),
        textAlign: TextAlign.left,
      ),
    );
  }
}
