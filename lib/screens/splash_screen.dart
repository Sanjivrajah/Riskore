import 'package:flutter/material.dart';
import 'package:riskore/core/presets/colors.dart';
class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 40,
                  child: Image.asset('lib/assets/images/logo.png', fit: BoxFit.cover),
                ),
                SizedBox(height: 20,),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 2),
                  child: Text(
                    'From Invisible to Eligible',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: ClipPath(
          //     clipper: HalfCircleClipper(),
          //     child: Container(
                
          //       height: 200,
          //       decoration: BoxDecoration(
          //         gradient: splashScreenGradient(),
          //         borderRadius: BorderRadius.circular(1000)
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


