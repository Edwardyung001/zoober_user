

import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';

import '../../../../core/constants/images.dart' show startride;

class StartRide extends StatefulWidget {
  const StartRide({super.key});

  @override
  State<StartRide> createState() => _StartRideState();
}

class _StartRideState extends State<StartRide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Ride",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 250, child: Image.asset(startride)),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Ride was started",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                  onTap: () {
                    navigateTo(context, HomeScreen());

                  },
                  child: SizedBox(width: 350, child: custombutton(text: "Done")))
            ],
          ),
        ));
  }
}
