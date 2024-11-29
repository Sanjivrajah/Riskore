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
              color: widget.backgroundColor,
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
                  color: widget.fillColor,
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
  final double value;
  final Color color;

  CircularArchProgressBarPainter({
    required this.strokeWidth,
    required this.value,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double startAngle = -math.pi; // Start from the top-left
    final double sweepAngle = math.pi * (value / 100); // Half-circle

    canvas.drawArc(
      Rect.fromCircle(center: Offset(radius, radius), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
