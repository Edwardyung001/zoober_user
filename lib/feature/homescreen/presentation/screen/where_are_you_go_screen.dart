import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';
import 'package:intl/intl.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/signup.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/paymentmethod.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/start_riding.dart';

class WhereAreYouGoScreen extends StatefulWidget {
  @override
  State<WhereAreYouGoScreen> createState() => _WhereAreYouGoScreenState();
}

class _WhereAreYouGoScreenState extends State<WhereAreYouGoScreen> {
  @override
  String? selectedTimeOption;
  String? selectedRiderType;
  DateTime? selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(minutes: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final keyboardHeight = mediaQuery.viewInsets.bottom;

    return Scaffold(
      appBar: AppBar(
        title: Text("Where you go ? ", style: TextStyle(color: Colors.white)),
        backgroundColor: Splashtopcolor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for Pickup Location
            Row(
              children: [
                // DROPDOWN 1 - Pickup Time
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                    ),
                    margin: EdgeInsets.only(
                      bottom: screenHeight * 0.015,
                      right: 8,
                    ),
                    decoration: _boxDecoration(screenHeight),
                    child: DropdownButtonFormField<String>(
                      value: selectedTimeOption,
                      decoration: _inputDecoration(
                        Icons.access_time,
                        Colors.green,
                        screenWidth,
                      ),
                      hint: Text('Pickup Time'),
                      items:
                          ['Now', 'Later']
                              .map(
                                (option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                ),
                              )
                              .toList(),
                      onChanged: (value) async {
                        setState(() {
                          selectedTimeOption = value;
                        });

                        if (value == 'Later') {
                          await _selectDateTime(context);
                        }
                      },
                    ),
                  ),
                ),

                // DROPDOWN 2 - Ride For
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                    ),
                    margin: EdgeInsets.only(
                      bottom: screenHeight * 0.015,
                      left: 8,
                    ),
                    decoration: _boxDecoration(screenHeight),
                    child: DropdownButtonFormField<String>(
                      value: selectedRiderType,
                      decoration: _inputDecoration(
                        Icons.group,
                        Colors.red,
                        screenWidth,
                      ),
                      hint: Text('Ride For'),
                      items:
                          ['For Me', 'Groups']
                              .map(
                                (option) => DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(option),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedRiderType = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (selectedDateTime != null)
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.015),
                child: Text(
                  'Scheduled for: ${DateFormat.yMd().add_jm().format(selectedDateTime!)}',
                  style: TextStyle(fontSize: screenWidth * 0.035),
                ),
              ),

            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                    ), // Dynamic horizontal padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        screenHeight * 0.01,
                      ), // Dynamic border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius:
                              screenHeight * 0.01, // Dynamic shadow blur radius
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Pickup Location',
                        contentPadding: EdgeInsets.only(
                          left: width(0.04, context),
                        ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: screenWidth * 0.04,
                        ), // Dynamic icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Search Drop Location
            SizedBox(height: height(0.013, context)),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                    ), // Dynamic horizontal padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        screenHeight * 0.01,
                      ), // Dynamic border radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius:
                              screenHeight * 0.01, // Dynamic shadow blur radius
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Drop Location',
                        contentPadding: EdgeInsets.only(
                          left: width(0.04, context),
                        ),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.circle,
                          color: red,
                          size: screenWidth * 0.04,
                        ), // Dynamic icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Pickup Suggestions Text
            SizedBox(height: height(0.02, context)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Text(
                "Pickup Suggestions",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Pickup Suggestion Cards
            Expanded(
              child: ListView(
                children: [
                  _buildVehicleCard(
                    "Auto",
                    "Assets/auto.webp",
                    screenHeight,
                    "10 mins away",
                    "Drop 1:14 PM",
                    "₹177",
                  ),
                  _buildVehicleCard(
                    "Bike",
                    "Assets/Scooter.png",
                    screenHeight,
                    "10 mins away",
                    "Drop 1:14 PM",
                    "₹177",
                  ),
                  _buildVehicleCard(
                    "Car",
                    "Assets/car.png",
                    screenHeight,
                    "10 mins away",
                    "Drop 1:14 PM",
                    "₹177",
                  ),
                  _buildVehicleCard(
                    "Intercity",
                    "Assets/car.png",
                    screenHeight,
                    "10 mins away",
                    "Drop 1:14 PM",
                    "₹177",
                  ),
                ],
              ),
            ),
            if (keyboardHeight == 0)
            Center(
              child: SizedBox(
                  height:screenHeight * 0.1,
                  width:screenWidth * 0.3,
                  child: InkWell(
                    onTap: () {
                  navigateTo(context, PaymentMethodScreen());
                  },
                  child: custombutton(
                        text: "Start Riding"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildVehicleCard(
  String title,
  String assetPath,
  double screenHeight,
  String timeDescription, // e.g., "10 mins away"
  String dropTime, // e.g., "Drop 1:14 PM"
  String amount, // e.g., "₹177"
) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(screenHeight * 0.01),
    ),
    child: Padding(
      padding: EdgeInsets.all(screenHeight * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vehicle image (Icon on the Left)
          SizedBox(
            height: screenHeight * 0.05,
            width: screenHeight * 0.05,
            child: Image.asset(assetPath, fit: BoxFit.contain),
          ),
          SizedBox(width: screenHeight * 0.02),

          // Text info (Title on the first line)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * 0.02,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),

              // Description: Time, Drop, and Amount all on the same line
              Row(
                children: [
                  Text(
                    "$timeDescription - $dropTime",
                    style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    width: screenHeight * 0.02,
                  ), // Space between Drop and Amount
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: screenHeight * 0.017,
                      color: Colors.green[800],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

BoxDecoration _boxDecoration(double screenHeight) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(screenHeight * 0.01),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        blurRadius: screenHeight * 0.01,
      ),
    ],
  );
}

/// Helper for input decoration
InputDecoration _inputDecoration(
  IconData icon,
  Color color,
  double screenWidth,
) {
  return InputDecoration(
    icon: Icon(icon, color: color, size: screenWidth * 0.05),
    border: InputBorder.none,
    contentPadding: EdgeInsets.only(left: screenWidth * 0.01),
  );
}
