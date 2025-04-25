import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';


class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    fetching();
  }

  void fetching() async {
    final userId = await SecureStorage.getValue('userId');
    if (userId != null) {
      context.read<HomeBloc>().add(FetchingProfileRequested(userId: userId));
    }
  }

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
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
            print(state.error);
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FetchingProfileSuccess) {
            final userDetails = state.userDetails;
            print(userDetails);
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    CircleAvatar(
                      radius: profileImageSize / 2,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/premium-photo/3d-style-avatar-profile-picture-featuring-male-character-generative-ai_739548-13626.jpg"),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      userDetails[0]['firstname'] ?? '',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

                    /// Username
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: EditNameBottomSheet(),
                          ),
                        );
                      },
                      child: _buildReadOnlyField(
                        'Username',
                        userDetails[0]['firstname'] ?? '',
                        screenWidth,
                      ),
                    ),

                    /// Phone number
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: EditNoBottomSheet(),
                          ),
                        );
                      },
                      child: _buildReadOnlyField(
                        'Phone number',
                        userDetails[0]['mobile'] ?? '+91 XXXXX XXXXX',
                        screenWidth,
                      ),
                    ),

                    /// Email
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: EditEmailBottomSheet(),
                          ),
                        );
                      },
                      child: _buildReadOnlyField(
                        'Email',
                        userDetails[0]['email'] ?? "Not available",
                        screenWidth,
                      ),
                    ),

                    /// Gender
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: EditGender(),
                          ),
                        );
                      },
                      child: _buildReadOnlyField(
                        'Gender',
                        userDetails[0]['gender'] ?? "Not specified",
                        screenWidth,
                      ),
                    ),

                    /// Birthday
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate:
                          DateTime.now().subtract(Duration(days: 365 * 18)),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                      },
                      child: _buildReadOnlyField(
                        'Birthday',
                        userDetails[0]['dob'] ?? "Not set",
                        screenWidth,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(child: Text("Failed to load profile"));
        },
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
          Text(label, style: TextStyle(fontSize: screenWidth * 0.04)),
          SizedBox(height: screenWidth * 0.01),
          Row(
            children: [
              Text(
                "$value      ",
                style: TextStyle(
                    fontSize: screenWidth * 0.035, color: Colors.grey),
              ),
              const Icon(Icons.arrow_forward_ios_outlined, size: 25),
            ],
          ),
        ],
      ),
    );
  }
}

class EditNameBottomSheet extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {
          // Show loading snackbar or indicator

        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          final userId = await SecureStorage.getValue('userId');
          context
              .read<HomeBloc>()
              .add(FetchingProfileRequested(userId: userId!));
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
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
              const Text(
                'Edit Name',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: firstNameController,
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
                controller: lastNameController,
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
              SizedBox(
                  width: double.infinity,
                  child: InkWell(
                      onTap: () async {
                        final firstName = firstNameController.text.trim();
                        final lastName = lastNameController.text.trim();
                        String? userId = await SecureStorage.getValue('userId');
                        context.read<HomeBloc>().add(FirstProfileRequested(
                          firstName: firstName,
                          lastName: lastName,
                          userId: userId!,
                        ));
                        Navigator.pop(context); // close bottom sheet
                      },
                      child: custombutton(text: "Save Changes"))),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class EditNoBottomSheet extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {

        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          final userId = await SecureStorage.getValue('userId');
          context
              .read<HomeBloc>()
              .add(FetchingProfileRequested(userId: userId!));
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
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
              const Text(
                'Edit Phone number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneNumberController,
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
              SizedBox(
                  width: double.infinity,
                  child: InkWell(
                      onTap: () async {
                        final phoneNumber = phoneNumberController.text.trim();
                        String? userId = await SecureStorage.getValue('userId');
                        context.read<HomeBloc>().add(MobileProfileRequested(
                          userId: userId!,
                          mobile: phoneNumber,
                        ));
                        Navigator.pop(context); // close bottom sheet

                      },
                      child: custombutton(text: "Save Changes"))),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class EditEmailBottomSheet extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {
          // Show loading snackbar or indicator

        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          final userId = await SecureStorage.getValue('userId');
          context
              .read<HomeBloc>()
              .add(FetchingProfileRequested(userId: userId!));
          Navigator.pop(context); // close bottom sheet
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
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
              const Text(
                'Edit Email ID',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
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
              SizedBox(
                  width: double.infinity,
                  child: InkWell(
                      onTap: () async {
                        final email = emailController.text.trim();
                        String? userId = await SecureStorage.getValue('userId');
                        context.read<HomeBloc>().add(EmailProfileRequested(
                          userId: userId!,
                          email: email,
                        ));
                        Navigator.pop(context); // close bottom sheet

                      },
                      child: custombutton(text: "Save Changes"))),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class EditGender extends StatefulWidget {
  @override
  State<EditGender> createState() => _EditGenderState();
}

class _EditGenderState extends State<EditGender> {
  String? selectedGender;

  void saveGender() async {
    final userId = await SecureStorage.getValue('userId');

    if (selectedGender != null && userId != null) {
      context.read<HomeBloc>().add(GenderProfileRequested(
        userId: userId,
        gender: selectedGender!,
      ));
      Navigator.pop(context); // close bottom sheet

    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) async {
        if (state is HomeLoading) {

        } else if (state is UpdateProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          final userId = await SecureStorage.getValue('userId');
          context
              .read<HomeBloc>()
              .add(FetchingProfileRequested(userId: userId!));
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _genderCard("Male", Icons.male_outlined),
                _genderCard("Female", Icons.female_outlined),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                  onTap: saveGender, child: custombutton(text: "Save Changes")),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _genderCard(String label, IconData icon) {
    final isSelected = selectedGender == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = label;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Icon(icon,
                size: 40, color: isSelected ? Colors.blue : Colors.black),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
