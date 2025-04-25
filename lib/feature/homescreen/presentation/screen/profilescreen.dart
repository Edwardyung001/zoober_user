import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),

              CircleAvatar(
                radius: profileImageSize / 2,
                backgroundImage: const NetworkImage(
                    "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg"),
              ),
              SizedBox(height: screenHeight * 0.01),
              const Text(
                "Lokeshwaran",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Upload photo',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Input Fields
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: white,
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: EditNameBottomSheet(),
                        );
                      },
                    );
                  },
                  child:
                  _buildReadOnlyField('Username', 'Loke112', screenWidth)),

              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: white,
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    builder: (BuildContext context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: EditNoBottomSheet(),
                      );
                    },
                  );
                },
                child: _buildReadOnlyField(
                    'Phone number', '+91 9988 77665', screenWidth),
              ),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: white,
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: EditEmailBottomSheet(),
                        );
                      },
                    );
                  },
                  child: _buildReadOnlyField(
                      'Email', 'Loke1128@gmail.com', screenWidth)),
              InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: white,

                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      builder: (BuildContext context) {
                        return Padding(
                          padding: MediaQuery.of(context).viewInsets,
                          child: EditGender(),
                        );
                      },
                    );
                  },
                  child: _buildReadOnlyField('Gender', 'Male', screenWidth)),
              InkWell(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now().subtract(Duration(
                            days: 365 * 18)), // Default to 18 years ago
                        firstDate:
                        DateTime(1900), // Allow DOBs starting from 1900
                        lastDate: DateTime.now());
                  },
                  child: _buildReadOnlyField(
                      'Birthday', 'April 16, 198', screenWidth)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String initialValue, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: screenWidth * 0.045),
        ),
        style: TextStyle(fontSize: screenWidth * 0.055),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: screenWidth * 0.04),
          ),
          SizedBox(height: screenWidth * 0.01),
          Row(
            children: [
              Text(
                value + "      ",
                style: TextStyle(
                    fontSize: screenWidth * 0.035, color: Colors.grey),
              ),
              const Icon(Icons.arrow_forward_ios_outlined, size: 25)
            ],
          ),
        ],
      ),
    );
  }
}

class EditNameBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const Text(
              'Edit Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                labelText: 'First Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline),
                labelText: 'Last Name',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                child: custombutton(text: "Save Changes")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class EditNoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const Text(
              'Edit Phone number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                labelText: 'New Phone Number',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                child: custombutton(text: "Save Changes")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class EditEmailBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const Text(
              'Edit Email ID',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                labelText: 'New Email ID',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
                width: double.infinity,
                child: custombutton(text: "Save Changes")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class EditGender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const Row(
              children: [
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(
                          Icons.male_outlined,
                          size: 40,
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.female_outlined,
                              size: 40,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const SizedBox(
                width: double.infinity,
                child: custombutton(text: "Save Changes")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
