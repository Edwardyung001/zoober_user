import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/rideinsurancefaq.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/ridersafteyfaq.dart';

import '../../../../core/constants/routing.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  String? name;

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    String? fetchedName = await SecureStorage.getValue('name');
    setState(() {
      name = fetchedName;
    });
  }
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.15; // 15% of screen width

    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.white,
        title: Text('Help'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            ListTile(
              leading: CircleAvatar(
                radius: profileImageSize / 2,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg"), // Replace with actual image asset
              ),
              title: Text(
                  (name ?? '').toUpperCase(),
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

            Divider(
              color: const Color.fromARGB(255, 228, 228, 228),
            ),

            InkWell(
              onTap: () {
                navigateTo(context, Riderinsurancefaq());
              },
              child: _buildSettingsItem(
                  context,
                  Icons.document_scanner_outlined,
                  'Ride Insurance',
                  Color(0xff4CD964)),
            ),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),

            InkWell(
                onTap: () {
                  navigateTo(context, Ridersafteyfaq());
                },
                child: _buildSettingsItem(context, Icons.privacy_tip,
                    'Ride Safety', Color(0xff8F8E94))),
            Divider(color: Color.fromARGB(255, 228, 228, 228)),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, IconData icon, String title, Color bgcolor) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
              color: bgcolor,
              borderRadius: BorderRadius.circular(height(0.01, context))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: screenWidth * 0.07,
              color: white,
            ),
          )),
      title: Text(
        title,
        style: TextStyle(fontSize: screenWidth * 0.045),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      // onTap: () {
      //   if (title == "Vehicle Management") {
      //     navigateTo(context, VehicleManagementPage());
      //   } else if (title == "Document Management") {
      //     navigateTo(context, DocumentManagementPage());
      //   }
      //},
    );
  }
}
