import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/mediaquery.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/auth/presentation/screen/login.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/landing_screen.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/profilescreen.dart';
import 'favouriteslist.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    final userId = await SecureStorage.getValue('userId');
    if (userId != null) {
      context.read<HomeBloc>().add(FetchingProfileRequested(userId: userId));
    }
  }

  Future<void> _clearAllAndLogout(BuildContext context) async {
    await SecureStorage.clearAll();
    print('🔒 SecureStorage cleared!');
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    //final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.15; // 15% of screen width
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate to FavoritesListScreen and remove current screen from stack
            navigateTo(context, HomeScreen());
          },
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is FetchingProfileSuccess) {
            final userDetails = state.userDetails;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Profile Section
                  ListTile(
                    leading: CircleAvatar(
                      radius: profileImageSize / 2,
                      backgroundImage: NetworkImage(
                        userDetails[0]['profile']?.isNotEmpty == true
                            ? userDetails[0]['profile']
                            : "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg",
                      ),
                    ),
                    title: Text(
                      (name ?? '').toUpperCase(),
                      style: TextStyle(fontSize: screenWidth * 0.05),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      'Gold Member',
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  SizedBox(height: height(0.028, context)),
                  InkWell(
                    onTap: () {
                      navigateTo(context, ProfileScreen());
                    },
                    child: _buildSettingsItem(
                      context,
                      Icons.person_outline,
                      'Profile',
                      Color(0xffFF9500),
                    ),
                  ),
                  Divider(color: const Color.fromARGB(255, 228, 228, 228)),

                  InkWell(
                    onTap: () {
                      navigateTo(context, FavoritesListScreen());
                    },
                    child: _buildSettingsItem(
                      context,
                      Icons.favorite_border_outlined,
                      'Favourite',
                      Color(0xff4CD964),
                    ),
                  ),
                  Divider(color: Color.fromARGB(255, 228, 228, 228)),

                  _buildSettingsItem(
                    context,
                    Icons.privacy_tip,
                    'About',
                    Color(0xff8F8E94),
                  ),
                  Divider(color: Color.fromARGB(255, 228, 228, 228)),

                  InkWell(
                    onTap: () async {
                      await _clearAllAndLogout(context);
                    },

                    child: _buildSettingsItem(
                      context,
                      Icons.logout_outlined,
                      'Logout',
                      Color.fromARGB(255, 238, 217, 33),
                    ),
                  ),
                  Divider(color: Color.fromARGB(255, 228, 228, 228)),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: white,
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: DeleteAccount(),
                          );
                        },
                      );
                    },
                    child: _buildSettingsItem(
                      context,
                      Icons.delete_outline,
                      'Delete Account',
                      Color(0xffFF2D55),
                    ),
                  ),
                  Divider(color: Color.fromARGB(255, 228, 228, 228)),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    Color bgcolor,
  ) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(height(0.01, context)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, size: screenWidth * 0.07, color: white),
        ),
      ),
      title: Text(title, style: TextStyle(fontSize: screenWidth * 0.045)),
      trailing: Icon(Icons.arrow_forward_ios),
      // onTap: () {
      //   if (title == "Vehicle Management") {
      //     navigateTo(context, VehicleManagementPage());
      //   } else if (title == "Document Management") {
      //     navigateTo(context, DocumentManagementPage());
      //   }
      // },
    );
  }
}

class DeleteAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {
          print('loading');
        } else if (state is DeleteAccountSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
          );
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${state.error}")));
          print("Error: ${state.error}");
        }
      },
      child: Padding(
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
              Row(
                children: [
                  Text(
                    'Are you want to delete your account ?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  String? userId = await SecureStorage.getValue('userId');
                  print(userId);
                  context.read<HomeBloc>().add(
                    DeleteAccountRequested(userId: userId!),
                  );
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: custombutton(
                    text: "Delete",
                    buttoncolor1: Color.fromARGB(255, 250, 226, 11),
                    buttoncolor2: Color.fromARGB(255, 250, 226, 11),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: double.infinity,
                child: custombutton(text: "Go Back"),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

void deliverylocation() {
  for (var i = 0; i < 1; i++) {
    print("enteringggg");
    if (i == 5) {
      print("goback");
    } else {
      i = 5;
      if (i == 6) {
        print("return recursive");
      } else {
        i = 7;
      }
      if (i == 0) {
        print("return1");
      } else {
        print("deliver");
      }
      for (var i = 0; i < 56; i++) {
        print("return3");
        for (var j = 5; j < 5; j++) {}
      }
    }
  }
}
