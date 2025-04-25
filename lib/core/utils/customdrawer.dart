
import 'package:flutter/material.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/helpscreen.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/notifications.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/paymentmethod.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/ridehistory.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/settings.dart';

import '../constants/colors.dart';
import '../constants/routing.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String? profileImageUrl; // Optional profile image URL
  final VoidCallback onDrawerClose;

  CustomDrawer({
    required this.userName,
    this.profileImageUrl,
    required this.onDrawerClose,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      child: Column(
        children: [
          // Drawer Header
          Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
                color: buttonrightcolor),
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg"),
                        // backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Lokesh waran',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Icon(
                      Icons.fast_forward_sharp,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10,
          ),

          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.help,
                  text: 'Help',
                  onTap: () {
                    navigateTo(context, HelpPage());
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.payment,
                  text: 'Payments',
                  onTap: () {
                    navigateTo(context, PaymentMethodScreen());
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.directions_bike,
                  text: 'My Rides',
                  onTap: () {
                    navigateTo(context, RideHistoryScreen());
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.notifications,
                  text: 'Notifications',
                  onTap: () {
                    navigateTo(context, NotificationScreen());
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    navigateTo(context, SettingsPage());
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.logout,
                  text: 'Logout',
                  onTap: () {
                    navigateTo(context, LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey),
        title: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}

class DrawerMenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const DrawerMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}
