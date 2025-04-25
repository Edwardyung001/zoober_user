import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/images.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';
import '../../../core/constants/blocs.dart';
import '../../../core/constants/routing.dart';
import '../bloc/splashscreen_bloc.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    splashscreenBloc.add(SplashScreenRountingEvent());
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashscreenBloc, SplashscreenState>(
        bloc: splashscreenBloc,
        buildWhen: (previous, current) => current is! SplashscreenActionState,
        listenWhen: (previous, current) => current is SplashscreenActionState,
        listener: (context, state) {
          if (state is SplashScreenRoutingState) {
            if (state.toLogin) {
              navigateTo(context, LoginScreen());
            } else {
              navigateTo(context, HomeScreen()); // or your HomeScreen()
            }
          }
        },
        builder: (context, state) {
          return Container(
            height: height(1, context),
            width: width(1, context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Splashtopcolor, Splashbottomcolor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: FadeTransition(
                opacity: _animation,
                child: Container(
                  width: width(0.8, context),
                  height: height(0.05, context),
                  child: Image.asset(
                    Applogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
