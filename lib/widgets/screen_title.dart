import 'package:flutter/material.dart';
import 'package:riskore/presets/fonts.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: AppFonts.largeExtraLightText(context),
        textAlign: TextAlign.center,
      ),
    );
  }
}
