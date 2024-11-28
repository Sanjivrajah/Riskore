import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/fonts.dart';
import 'package:riskore/presets/styles.dart';
import 'package:sizer/sizer.dart';

class DatePickerButton extends StatefulWidget {
  final String text;

  const DatePickerButton({
    super.key,
    required this.text,
  });

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  DateTime? _selectedDate;

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 54.sp),
      decoration: BoxDecoration(
        color: AppColor.white.withOpacity(0.125),
        borderRadius: AppStyles.borderRadiusFullyRounded,
      ),
      padding: EdgeInsets.only(left: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: AppFonts.smallLightText(context),
          ),
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
