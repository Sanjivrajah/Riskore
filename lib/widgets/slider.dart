import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final Function(double) onChanged;

  const CustomSlider({
    Key? key,
    required this.value,
    this.min = 0.0,
    this.max = 1.0,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 0,
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 5.0,
          thumbColor: Colors.white,
          activeTrackColor: AppColor.green,
          inactiveTrackColor: AppColor.white.withOpacity(0.3),
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        ),
        child: Slider(
          value: widget.value,
          min: widget.min,
          max: widget.max,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
