import 'package:flutter/material.dart';
import 'package:riskore/presets/colors.dart' as colors;
import 'package:riskore/screens/authentication/auth.dart';
import 'package:riskore/screens/authentication/presentation/signup_screen.dart';
import 'package:riskore/screens/dashboard/presentation/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Auth _auth = Auth();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      // Navigate to the main app screen after successful login
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString(); // Handle error
      });
    }
  }

  void _navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              SignUpScreen()), // Navigate to signup screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: colors.AppColor.black),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 60),
                Image.asset('lib/assets/images/logo.png',
                    width: 100, height: 40),
                SizedBox(height: 60),
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    color: colors.AppColor.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Welcome back, good to see you!",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00FF85)),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white30),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00FF85)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                // Display error message if it exists
                if (_errorMessage != null) ...[
                  SizedBox(height: 8), // Space before the error message
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Colors.red, // Set the error message color to red
                      fontSize: 14,
                    ),
                  ),
                ],
                SizedBox(height: 48),
                // Spacer(), // Push the login section to the bottom
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OR",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: _navigateToSignup,
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
