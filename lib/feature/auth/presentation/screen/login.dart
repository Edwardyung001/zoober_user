import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login_otp_screen.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/signup.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';

import '../../../../core/constants/routing.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async{
          if (state is AuthLoading) {

       print('loading');
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message),backgroundColor: Colors.green,),
            );
            await SecureStorage.saveValue('token', state.token);
            await SecureStorage.saveValue('name', state.name);
            await SecureStorage.saveValue('userId', state.userId.toString());
            navigateTo(context, HomeScreen());
          } else if(state is LoginFailed){

          }

          else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
            print("Error: ${state.error}");
          }
        },
        child: SingleChildScrollView(
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
                            height: mediaQuery.height * 0.05,
                            child: Image.asset(
                              'Assets/logo2.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: mediaQuery.height * 0.05),
                      SizedBox(
                        height: mediaQuery.height * 0.2,
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

                      SizedBox(height: mediaQuery.height * 0.02),
                      // Spacer
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          if (state is LoginFailed)
                            Text(
                              state.errorMessage,
                              style: TextStyle(color: Colors.red),
                            ),
                          // Your form widgets here
                        ],
                      );
                    },
                  ),
                      SizedBox(height: mediaQuery.height * 0.02),

                      // Phone Number Input Field
                      TextField(
                        controller: phoneController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(mediaQuery.width * 0.02),
                          ),
                          labelText: 'Phone number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(height: mediaQuery.height * 0.01), // Spacer
                      TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(mediaQuery.width * 0.02),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock,),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,size: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),

                        ),

                      ),
                      SizedBox(height: mediaQuery.height * 0.05), // Spacer

                      // Send OTP Button
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, SignUpScreen());
                            },
                            child: SizedBox(
                              height: mediaQuery.height * 0.08,
                              width: mediaQuery.width * 0.3,
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.blue, width: 1.5), // underline
                                    ),
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: mediaQuery.width * 0.04,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none, // turn off default underline
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),



                          Spacer(),
                          InkWell(
                            onTap: () {
                              navigateTo(context, LoginOtpScreen());

                            },

                            child: SizedBox(
                              height: mediaQuery.height * 0.08,
                              width: mediaQuery.width * 0.3,
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.blue, width: 1.5), // underline
                                    ),
                                  ),
                                  child: Text(
                                    "Login OTP",
                                    style: TextStyle(
                                      fontSize: mediaQuery.width * 0.04,
                                      color: Colors.blue,
                                      decoration: TextDecoration.none, // turn off default underline
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: mediaQuery.height * 0.02), // Spacer
                      InkWell(
                          onTap: () {
                            final phone = phoneController.text.trim();
                            final password = passwordController.text
                                .trim();
                            if (phone.isNotEmpty && phone.isNotEmpty) {
                              context.read<AuthBloc>().add(LoginRequested(
                                phoneNumber: phone,
                                password: password,
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please fill all fields")),
                              );
                            }
                          },
                          child: custombutton(
                              text: "Login")),
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
      ),
    );


  }
}
