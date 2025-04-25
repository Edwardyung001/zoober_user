import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'insuranceforridefaqdetails.dart';
import 'insurancekickfaq.dart';

class Riderinsurancefaq extends StatefulWidget {
  const Riderinsurancefaq({super.key});

  @override
  State<Riderinsurancefaq> createState() => _RiderinsurancefaqState();
}

class _RiderinsurancefaqState extends State<Riderinsurancefaq> {
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
              navigateTo(context, insurancekickfaqdetails());
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child:
                  _buildReadOnlyField("What does the isurance kick in?", 0.2),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              navigateTo(context, ClaimInsurancefaqdetails());
            },
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: _buildReadOnlyField(
                  "I want to claim a Insurance for a ride", 0.2),
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
