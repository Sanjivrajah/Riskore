import 'package:flutter/material.dart';
import 'package:riskore/widgets/profile_container.dart';
import 'package:sizer/sizer.dart';

class AppBarProfile extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProfile({
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'lib/assets/images/logo.png',
              height: 18.sp,
            ),
            const ProfileContainer()
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(38.sp);
}
