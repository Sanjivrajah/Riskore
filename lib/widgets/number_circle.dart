import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NumberCircle extends StatelessWidget {
  const NumberCircle({
    super.key,
    required this.number,
    required this.color,
    required this.textStyle,
  });

  final String number;
  final Color color;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.sp,
      width: 28.sp,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          number,
          style: textStyle,
        ),
      ),
    );
  }
}
