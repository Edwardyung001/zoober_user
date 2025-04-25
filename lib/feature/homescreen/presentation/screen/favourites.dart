import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';

import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';

import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/add_favourites.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';

class NewFavourites extends StatefulWidget {
  const NewFavourites({super.key});

  @override
  State<NewFavourites> createState() => _NewFavouritesState();
}

class _NewFavouritesState extends State<NewFavourites> {
  String selectedLocation = "🏠 Home"; // Default selected location

  final List<String> locations = [
    "🏠 Home",
    "💼 Work",
    "💪 Gym",
    "🎓 College",
    "🏨 Hostel",
    "😊 Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Map View
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[200],
              child: const Center(
                child: Icon(Icons.map, size: 100, color: Colors.grey),
              ),
            ),
          ),
          // Add to Favourites Section
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add to favourites",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text("Search"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  // Dummy location info row
                  const Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.trip_origin_outlined, size: 16, color: Colors.white),
                          ),
                          title: Text("Plot No", style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text("Lorem ipsum dolor sit amet, consectetur"),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 16.0),

                  const Text(
                    "SAVE LOCATION AS",
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),

                  // Location tags
                  Wrap(
                    spacing: 10.0,
                    children: locations.map((location) {
                      return _buildLocationButton(context, location);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton(BuildContext context, String label) {
    final bool isSelected = selectedLocation == label;

    return TextButton(
      onPressed: () {
        setState(() {
          selectedLocation = label;
        });

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AddFavouriteListBottomSheet(locationLabel: label),
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? buttonrightcolor : Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(label),
    );
  }
}
