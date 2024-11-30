import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart';
import 'package:riskore/presets/styles.dart';
import 'package:riskore/widgets/appbar_profile.dart';
import 'package:riskore/widgets/navigation_drawer.dart';
import 'package:riskore/widgets/screen_title.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBarProfile(press: ()=> {}),
      backgroundColor: AppColor.black,
      body: SafeArea(
        child:SingleChildScrollView(
          child: Padding(padding: AppStyles.edgeInsetsLR_20, 
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              const ScreenTitle(text: "My Account"), 
              SizedBox(height: 20.sp),
              Container(
                        width: 120, // Circle diameter
                        height: 120, // Circle diameter
                        decoration: BoxDecoration(
                          color: AppColor.green, // Circle color
                          shape: BoxShape.circle,
                        )),
            SizedBox(height: 20.sp), // Space between circle and text
            
                  Text(
                    'Ahmad', // Name below the circle
                    style: TextStyle(
                      fontSize: 18.sp, // Adjust font size as needed
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20.sp,),
                  NavDrawer(),
                  
            ],),
          ),),
        )

      ));
  }
}