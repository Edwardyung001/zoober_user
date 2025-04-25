import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';

import 'ridestart.dart';

class LocationSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Pickup Location
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth * 0.03), // Dynamic horizontal padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          screenHeight * 0.01), // Dynamic border radius
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
                        contentPadding:
                            EdgeInsets.only(left: width(0.04, context)),
                        border: InputBorder.none,
                        icon: Icon(Icons.circle,
                            color: Colors.green,
                            size: screenWidth * 0.04), // Dynamic icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Search Drop Location
            SizedBox(
              height: height(0.013, context),
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth * 0.03), // Dynamic horizontal padding
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          screenHeight * 0.01), // Dynamic border radius
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
                        contentPadding:
                            EdgeInsets.only(left: width(0.04, context)),
                        border: InputBorder.none,
                        icon: Icon(Icons.circle,
                            color: red,
                            size: screenWidth * 0.04), // Dynamic icon size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Pickup Suggestions Text
            SizedBox(
              height: height(0.02, context),
            ),
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
                  Card(
                    color: white,
                    child: ListTile(
                      leading: Icon(Icons.history, size: screenWidth * 0.07),
                      title: Text(
                        "TVS Tolgate",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Hanifa Colony, Sangiliandapuram\nTiruchirappalli, Tamil Nadu, India",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ),
                  ),
                  // Suggestion Card 2
                  InkWell(
                    onTap: () {
                      navigateTo(context, StartRide());
                    },
                    child: Card(
                      color: white,
                      child: ListTile(
                        leading: Icon(Icons.location_on,
                            size: screenWidth * 0.07, color: buttonleftcolor),
                        title: Text(
                          "Select on map",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
