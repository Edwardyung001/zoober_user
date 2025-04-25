import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double profileImageSize = screenWidth * 0.2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Done',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.blue,
              ),
            ),
          ),
        ],
        leading: TextButton(
          onPressed: () {},
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              color: Colors.blue,
            ),
          ),
        ),
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
                backgroundImage: AssetImage('assets/profile_image.jpg'),
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit photo',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.blue,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Input Fields
              _buildTextField('First name', 'Loke', screenWidth),
              _buildTextField('Last name', '', screenWidth),
              _buildReadOnlyField(
                  'Phone number', '+91 9988 77665', screenWidth),
              _buildReadOnlyField('Email', 'Loke1128@gmail.com', screenWidth),
              _buildReadOnlyField('Gender', 'Male', screenWidth),
              _buildReadOnlyField('Birthday', 'April 16, 198', screenWidth),
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
        style: TextStyle(fontSize: screenWidth * 0.045),
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: screenWidth * 0.045, color: Colors.grey),
          ),
          SizedBox(height: screenWidth * 0.01),
          Text(
            value,
            style: TextStyle(fontSize: screenWidth * 0.05),
          ),
        ],
      ),
    );
  }
}
