import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart'; // Assuming AppColor is defined here

class RoundedLinearProgressBar extends StatelessWidget {
  final double progress;

  const RoundedLinearProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomPaint(
          size: const Size.fromHeight(10), // Adjust height as needed
          painter: _RoundedLinearProgressPainter(
              progress, AppColor.green, AppColor.white.withOpacity(0.3)),
        ),
        const SizedBox(height: 10),
        Text(
          '${(progress * 100).toInt()}% Completed',
          style: AppFonts.smallLightText(context),
        ),
      ],
    );
  }
}

class _RoundedLinearProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;

  _RoundedLinearProgressPainter(
      this.progress, this.progressColor, this.backgroundColor);

  @override
  void paint(Canvas canvas, Size size) {
    // Draw background bar
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    final backgroundRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRRect(
        RRect.fromRectAndRadius(backgroundRect, const Radius.circular(10)),
        backgroundPaint);

    // Draw progress bar
    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.fill;
    final progressWidth = size.width * progress;
    final progressRect = Rect.fromLTWH(0, 0, progressWidth, size.height);
    canvas.drawRRect(
        RRect.fromRectAndRadius(progressRect, const Radius.circular(10)),
        progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
