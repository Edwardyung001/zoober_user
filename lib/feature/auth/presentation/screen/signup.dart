import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login.dart';
class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  String? selectedGender;
  bool _obscureText = true;


  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    dobController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            print('loading');

          } else if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message,),backgroundColor: Colors.green,),
            );
            navigateTo(context, LoginScreen());
          } else if (state is AuthFailure) {
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
                // Logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mediaQuery.height * 0.02,
                      child: Image.asset('Assets/logo2.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                // Illustration
                SizedBox(
                  height: mediaQuery.height * 0.3,
                  child: Image.asset('Assets/signup.png'),
                ),
                SizedBox(height: mediaQuery.height * 0.05),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.07,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.01),
                Text(
                  'Sign up with Email and Phone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.04),
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'First Name',
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),

                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Last Name',
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress, // This will show the email keyboard on mobile devices
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')), // Allows only email-related characters
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: mobileNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Mobile Number',
                    prefixIcon: Icon(Icons.call),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                TextField(
                  controller: dobController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Date of Birth',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                DropdownButtonFormField<String>(
                  value: selectedGender,
                  items: ['Male', 'Female', 'Other'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(mediaQuery.width * 0.02),
                    ),
                    labelText: 'Gender',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.02),
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
                SizedBox(height: mediaQuery.height * 0.04),
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
                SizedBox(height: mediaQuery.height * 0.04),

                /// ⏩ Custom SIGN UP button with BLoC
                InkWell(
                  onTap: () {
                    final email = emailController.text.trim();
                    final mobileNumber = mobileNumberController.text.trim();
                    final firstName = firstNameController.text.trim();
                    final lastName = lastNameController.text.trim();
                    final gender = selectedGender;
                    final dob = dobController.text;
                    final password = passwordController.text.trim();


                    if (email.isNotEmpty && mobileNumber.isNotEmpty && password.isNotEmpty && gender != null && gender.isNotEmpty) {

                      if (password.length < 6) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password must be at least 10 characters long")),
                        );
                        return;
                      }

                      // Proceed with the signup request if all fields are valid
                      context.read<AuthBloc>().add(SignupRequested(
                        email: email,
                        mobileNumber: mobileNumber,
                        firstName: firstName,
                        lastName: lastName,
                        gender: gender,
                        dob: dob.toString(),
                        password: password,
                      ));
                    } else {
                      // Show snackbar if any required field (email, mobileNumber, password) is missing
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all required fields (Email, Mobile Number, gender and Password)")),
                      );
                    }
                  },

                  child: custombutton(text: "SIGN UP"),
                ),

                SizedBox(height: mediaQuery.height * 0.02),
                Text(
                  'By continuing, you agree to the Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: mediaQuery.width * 0.035,
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
