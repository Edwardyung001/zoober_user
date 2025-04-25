import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';

class Sosfaqdetails extends StatefulWidget {
  const Sosfaqdetails({super.key});

  @override
  State<Sosfaqdetails> createState() => _SosfaqdetailsState();
}

class _SosfaqdetailsState extends State<Sosfaqdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
        title: const Text("FAQs"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFE7ECFA),
                    borderRadius: BorderRadius.circular(12)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              radius: 12,
                              backgroundColor: buttonrightcolor,
                              child: Icon(
                                Icons.question_mark_outlined,
                                color: white,
                                size: 10,
                              )),
                          Flexible(
                            child: Text(
                              "  How does SOS option work?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 21),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: Text(
                          """SOS feature enablkes you to connect with our Emergency Response team and seek help in case of any Emergencies/ accident. You will find an SOS button after your ride is booked. It also enables you to share the ride detalls with your trusted contacts.""",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFE7ECFA),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Text("Was this article helpful ?"),
                      Row(
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(Icons.thumb_down_alt_outlined)
                        ],
                      ),
                      Text(""),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
          const Icon(Icons.arrow_forward_ios_outlined, size: 25)
        ],
      ),
    );
  }
}
