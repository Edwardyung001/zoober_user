import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location/location.dart' as loc;
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/core/utils/customdrawer.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/where_are_you_go_screen.dart';

import 'where_are_you_go_screen_2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController sourcecontroller = TextEditingController();
  final TextEditingController designationcontroller = TextEditingController();
  static const target = LatLng(10.7905, 78.7047);
  GoogleMapController? mapController;
  LatLng? currentLocation;
  Set<Marker> markers = {};

  Future<void> _getCurrentLocation() async {
    loc.Location location = loc.Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    loc.LocationData _locationData = await location.getLocation();
    setState(() {
      currentLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
      markers.clear();
      markers.add(Marker(
        markerId: const MarkerId("current_location"),
        position: currentLocation!,
        infoWindow: InfoWindow(title: 'Current Location'),
      ));
    });

    mapController?.animateCamera(CameraUpdate.newLatLngZoom(currentLocation!, 14));
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(FetchingSuggestionRequested());
  }

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: buttonrightcolor,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.white,
        ),
        title: Text("Zoober Rider ", style: TextStyle(color: Colors.white)),
      ),
      key: _scaffoldKey,
      drawer: CustomDrawer(
        onDrawerClose: () {
          Navigator.pop(context);
        },
      ),
      body: Stack(
        children: [
          // Map background image
          SizedBox.expand(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: target, zoom: 15),
              onMapCreated: (controller) {
                mapController = controller;
              },
              markers: markers,
            ),
          ),

          // Current location and search bar
          Positioned(
            top: screenHeight * 0.01,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: _buildSearchResults(screenHeight, screenWidth),
          ),

          // Search result list at the bottom
          Positioned(
            bottom: screenHeight * 0.02,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: _buildVehicle(context,screenHeight, screenWidth),
          ),
          Positioned(
            bottom: screenHeight * 0.2,
            right: screenWidth * 0.04,
            child: FloatingActionButton(
              onPressed: _getCurrentLocation,
              child: Icon(Icons.my_location),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(double screenHeight, double screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: screenHeight * 0.02,
              ),
            ],
          ),
          child: TextField(
            controller: sourcecontroller,
            readOnly: true,
            onTap: () {
              navigateTo(context, WhereAreYouGoScreen()); // Navigate on tap
            },
            decoration: InputDecoration(
              hintText: 'Where are you going?',
              border: InputBorder.none,
              icon: Icon(Icons.search, size: screenHeight * 0.03),
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.01),
        InkWell(
          onTap: () {
            // navigateTo(context, LocationSearchPage());
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenHeight * 0.01),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: screenHeight * 0.02,
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSearchResultItem(
                  icon: Icons.history,
                  title: 'TVS Tolgate',
                  subtitle: 'Trichy, Tamil Nadu, India',
                  screenHeight: screenHeight,
                ),
                _buildSearchResultItem(
                  icon: Icons.history,
                  title: 'Chatram Bus Stand',
                  subtitle: 'Trichy, Tamil Nadu, India',
                  screenHeight: screenHeight,
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildSearchResultItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required double screenHeight,
  }) {
    return ListTile(
      leading: Icon(icon, color: blue, size: screenHeight * 0.03),
      title: Text(title, style: TextStyle(fontSize: screenHeight * 0.02)),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: screenHeight * 0.015),
      ),
    );
  }
}

Widget _buildVehicle(BuildContext context, double screenHeight, double screenWidth) {
  return Container(
    padding: EdgeInsets.all(screenHeight * 0.015),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(screenHeight * 0.01),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          blurRadius: screenHeight * 0.02,
        ),
      ],
    ),
    child: BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {

        } else if (state is FetchingSuggestionSuccess) {
          print(state.suggestionList);
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
          print("Error: ${state.error}");
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FetchingSuggestionSuccess) {
            final suggestionList = state.suggestionList;

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: suggestionList.map((vehicle) {
                // Provide static image based on vehicle name dynamically
                String imageAsset = _getImageBasedOnVehicleName(vehicle['name']);

                return _buildVehicleCard(
                  context,
                  vehicle['name'],  // dynamic name
                  imageAsset,        // dynamically assigned image path
                  screenHeight,
                );
              }).toList(),
            );
          } else if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Center(child: Text('No vehicles available.'));
          }
        },
      ),
    ),
  );
}

String _getImageBasedOnVehicleName(String vehicleName) {
  if (vehicleName == "Auto") {
    return 'Assets/auto.webp';
  } else if (vehicleName == "Bike") {
    return 'Assets/Scooter.png';
  } else if (vehicleName == "Cab") {
    return 'Assets/car.png';
  } else if (vehicleName == "Permium Cab") {
    return 'Assets/car.png';
  } else {
    return 'Assets/car.png'; // default image if no match found
  }
}

Widget _buildVehicleCard(BuildContext context, String title, String assetPath, double screenHeight) {
  return Expanded(
    child: InkWell(
      onTap: () {
        navigateTo(context, WhereAreYouGoScreenTwo(vehicleType: title));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight * 0.01),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: screenHeight * 0.04,
                child: Image.asset(assetPath, fit: BoxFit.contain),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}
