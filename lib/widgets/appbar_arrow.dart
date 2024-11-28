import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:sizer/sizer.dart';

class AppBarArrow extends StatelessWidget implements PreferredSizeWidget {
  const AppBarArrow({
    super.key,
    required this.press,
  });

  final void Function() press; // shorthand for void Function()

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: AppColor.white,
          highlightColor: Colors.white.withOpacity(0.1),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: press,
        ),
        title: Image.asset(
          'lib/assets/images/logo.png',
          width: 35.sp,
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(38.sp);
}
