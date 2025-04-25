import 'package:flutter/material.dart';

class Faq1screen extends StatefulWidget {
  const Faq1screen({super.key});

  @override
  State<Faq1screen> createState() => _Faq1screenState();
}

class _Faq1screenState extends State<Faq1screen> {
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
            _buildReadOnlyField(
                "What are the features available for female? rider safety",
                0.3),
            _buildReadOnlyField("How does SOS option work?", 0.3),
          ],
        ));
  }

  Widget _buildTextField(
      String label, String initialValue, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: screenWidth * 0.045),
        ),
        style: TextStyle(fontSize: screenWidth * 0.055),
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
          Text(
            label,
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
          SizedBox(height: screenWidth * 0.01),
          const Icon(Icons.arrow_forward_ios_outlined, size: 25),
        ],
      ),
    );
  }
}
