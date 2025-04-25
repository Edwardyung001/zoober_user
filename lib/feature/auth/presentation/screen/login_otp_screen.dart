import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/otp.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/signup.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';

import '../../../../core/constants/routing.dart';


class LoginOtpScreen extends StatefulWidget {
  @override
  State<LoginOtpScreen> createState() => _LoginOtpScreenState();
}

class _LoginOtpScreenState extends State<LoginOtpScreen> {

  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.width * 0.08,
              vertical: mediaQuery.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo or Image
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.03,
                      child: Image.asset(
                        'Assets/logo2.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: mediaQuery.height * 0.05),
                SizedBox(
                  height: mediaQuery.height * 0.4,
                  child: Image.asset('Assets/login.png'),
                ),

                SizedBox(height: mediaQuery.height * 0.05), // Spacer

                // Sign up text
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.07, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.01), // Small spacer

                // Sign up description
                Text(
                  'Login With Phone Number',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.04, // Responsive font size
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: mediaQuery.height * 0.02), // Spacer

                // Phone Number Input Field
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.1), // Spacer
                InkWell(
                    onTap: () {
                      navigateTo(context, OtpVerificationScreen());

                      // final phone = phoneController.text.trim();
                      // final password = passwordController.text
                      //     .trim();
                      // if (phone.isNotEmpty && phone.isNotEmpty) {
                      //   context.read<AuthBloc>().add(LoginRequested(
                      //     phoneNumber: phone,
                      //     password: password,
                      //   ));
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Please fill all fields")),
                      //   );
                      // }

                    },
                    child: custombutton(
                        text: "Login Mobile OTP")),

                SizedBox(height: mediaQuery.height * 0.02), // Spacer

                // Privacy Policy Text
                Text(
                  'By continuing, you agree to the Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.035, // Responsive font size
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
