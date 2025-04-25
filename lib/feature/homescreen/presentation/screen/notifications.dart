import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';


class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.check_circle,
      'color': Color(0xff4252FF),
      'title': 'System',
      'description': 'Booking #1234 has been successful',
    },
    {
      'icon': Icons.local_activity,
      'color': Color(0xffFFD428),
      'title': 'Promotion',
      'description': 'Invite friends - Get 3 coupons each',
    },
    {
      'icon': Icons.local_activity,
      'color': Color(0xffFFD428),
      'title': 'Promotion',
      'description': 'Invite friends - Get 3 coupons each',
    },
    {
      'icon': Icons.cancel,
      'color': Color(0xffF52D56),
      'title': 'System',
      'description': 'Booking #1205 has been cancelled',
    },
    {
      'icon': Icons.payment,
      'color': Color(0xff4CE5B1),
      'title': 'System',
      'description': 'Thank you! Your transaction is complete',
    },
    {
      'icon': Icons.local_activity,
      'color': Color(0xffFFD428),
      'title': 'Promotion',
      'description': 'Invite friends - Get 3 coupons each',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: white,
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // drawer: CustomDrawer(
      //   userName: 'Lokeshwaran',
      //   onDrawerClose: () {
      //     _scaffoldKey.currentState!.closeDrawer();
      //   },
      // ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              NotificationTile(
                icon: notifications[index]['icon'],
                color: notifications[index]['color'],
                title: notifications[index]['title'],
                description: notifications[index]['description'],
                screenWidth: screenWidth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(0.05, context)),
                child: Divider(),
              )
            ],
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final double screenWidth;

  const NotificationTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.description,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          radius: screenWidth * 0.07,
          child: Icon(
            icon,
            color: Colors.white,
            size: screenWidth * 0.08,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
