import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/screens/credit_report/all_reports_screen.dart';
import 'package:sizer/sizer.dart';

class CircularArchProgressBar extends StatefulWidget {
  final double value;
  final double strokeWidth;
  final Color fillColor;
  final Color backgroundColor;

  CircularArchProgressBar(
      {required this.value,
      this.strokeWidth = 10.0,
      this.fillColor = const Color(0xff73E491),
      this.backgroundColor = const Color.fromARGB(147, 158, 158, 158)});

  @override
  _CircularArchProgressBarState createState() =>
      _CircularArchProgressBarState();
}

class _CircularArchProgressBarState extends State<CircularArchProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation =
        Tween<double>(begin: 0.0, end: widget.value).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 50.sp,
          height: 35.sp,
          child: CustomPaint(
            painter: CircularArchProgressBarPainter(
              strokeWidth: widget.strokeWidth,
              value: 100,
            ),
          ),
        ),
        SizedBox(
          width: 50.sp,
          height: 35.sp,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: CircularArchProgressBarPainter(
                  strokeWidth: widget.strokeWidth,
                  value: _animation.value,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CircularArchProgressBarPainter extends CustomPainter {
  final double strokeWidth;
  final double value; // Progress value in percentage (0 to 100)
  final List<Color> segmentColors; // Colors for each segment
  final Color backgroundColor; // Static background color (e.g., white)

  CircularArchProgressBarPainter({
    required this.strokeWidth,
    required this.value,
    this.segmentColors = const [Colors.red, Colors.yellow, Colors.green],
    this.backgroundColor = Colors.white, // Default background color
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    final Rect arcRect = Rect.fromCircle(center: center, radius: radius);

    final double startAngle = -math.pi; // Start from the top-left
    final double totalSweepAngle = math.pi; // Half-circle
    final double progressSweepAngle = totalSweepAngle * (value / 100);

    // 1. Draw static background arc (white) for the full range
    paint.color = backgroundColor;
    canvas.drawArc(
      arcRect,
      startAngle,
      totalSweepAngle,
      false,
      paint,
    );

    // 2. Define segment angles and draw progress arcs
    final double segmentSweepAngle =
        totalSweepAngle / 3; // One-third of the half-circle

    double drawnAngle = 0;
    for (int i = 0; i < 3; i++) {
      paint.color = segmentColors[i];

      final double segmentStartAngle = startAngle + i * segmentSweepAngle;
      final double segmentEndAngle = segmentStartAngle + segmentSweepAngle;

      // Determine the angle to draw based on progress
      final double currentEndAngle = math.min(
        startAngle + progressSweepAngle,
        segmentEndAngle,
      );

      if (currentEndAngle > segmentStartAngle) {
        canvas.drawArc(
          arcRect,
          segmentStartAngle,
          currentEndAngle - segmentStartAngle,
          false,
          paint,
        );
        drawnAngle += currentEndAngle - segmentStartAngle;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
