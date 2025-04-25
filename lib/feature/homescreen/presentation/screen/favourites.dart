import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';


class NewFavourites extends StatelessWidget {
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
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add to favourites",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text("Search"),
                          ))
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Search Field
                  const Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.green,
                            child: Icon(Icons.trip_origin_outlined,
                                size: 16, color: Colors.white),
                          ),
                          title: Text(
                            "Plot No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                          Text("Lorem ipsum dolor sit amet, consectetur"),
                        ),
                      ),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "SAVE LOCATION AS",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),

                  Wrap(
                    spacing: 10.0,
                    children: [
                      _buildLocationButton(context, "🏠 Home", true, Icons.home),
                      _buildLocationButton(
                          context, "💼 Work", false, Icons.work_outline_sharp),
                      _buildLocationButton(
                          context, "💪 Gym", false, Icons.fitness_center_outlined),
                      _buildLocationButton(context, "🎓 College", false, Icons.school),
                      _buildLocationButton(context, "🏨 Hostel", false, Icons.business),
                      _buildLocationButton(
                          context, "😊 Others", false, Icons.catching_pokemon_sharp),
                    ],
                  ),

                  // SizedBox(
                  //     height: 50,
                  //     width: double.infinity,
                  //     child: InkWell(
                  //         onTap: () {
                  //           showModalBottomSheet(
                  //             context: context,
                  //             isScrollControlled:
                  //             true, // Allows the bottom sheet to adapt to its content
                  //             builder: (context) =>
                  //                 AddFavouriteListBottomSheet(locationLabel: "Unknown Location"), // Provide default or custom label
                  //           );
                  //         },
                  //         child: custombutton(text: "Add to favourite"))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton(
      BuildContext context, String label, bool isSelected, IconData icon) {
    return TextButton(
      onPressed: () {
        // Open the bottom sheet with the selected location label
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allows the bottom sheet to adapt to its content
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

class AddFavouriteListBottomSheet extends StatelessWidget {
  final descriptionController = TextEditingController();
  final String locationLabel; // Store the selected location label

  AddFavouriteListBottomSheet({required this.locationLabel}); // Receive the location label

  @override
  Widget build(BuildContext context) {
    return
     Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                color: Colors.grey,
                thickness: 3,
                indent: MediaQuery.of(context).size.width * 0.4,
                endIndent: MediaQuery.of(context).size.width * 0.4,
              ),
              const SizedBox(height: 16),
              Text(
                'Add Description for $locationLabel', // Display the selected location label
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.description),
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                  width: double.infinity,
                  child: InkWell(
                      onTap: () async {
                      //   final description = descriptionController.text.trim();
                      //   context.read<HomeBloc>().add(AddFavouriteListRequested(
                      //     title: locationLabel, // Use the location label
                      //     description: description,
                      //   ));
                      //   Navigator.pop(context); // close bottom sheet
                      },
                      child: custombutton(text: "Save Changes"))),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
  }
}
