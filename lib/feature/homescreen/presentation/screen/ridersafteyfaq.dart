import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/faqsosdetails.dart';

import 'ridesafetydetails.dart';

class Ridersafteyfaq extends StatefulWidget {
  const Ridersafteyfaq({super.key});

  @override
  State<Ridersafteyfaq> createState() => _RidersafteyfaqState();
}

class _RidersafteyfaqState extends State<Ridersafteyfaq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("FAQs"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, RideSafetyfaqdetails());
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: _buildReadOnlyField(
                  "What are the features available for female? rider safety",
                  0.3),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              navigateTo(context, Sosfaqdetails());
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: _buildReadOnlyField("How does SOS option work?", 0.3),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          const Icon(Icons.arrow_forward_ios_outlined, size: 25)
        ],
      ),
    );
  }
}
