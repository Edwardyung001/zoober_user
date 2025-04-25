
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/constants/colors.dart';
import 'package:zoober_user_ride/core/constants/routing.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/favouriteslist.dart';

class AddFavouriteListBottomSheet extends StatelessWidget {
  final String locationLabel;
  final TextEditingController descriptionController = TextEditingController();

  AddFavouriteListBottomSheet({super.key, required this.locationLabel});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoading) {
            Center(child: CircularProgressIndicator());
        } else if (state is FavouriteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          navigateTo(context, FavoritesListScreen());
        } else if (state is HomeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
          print("Error: ${state.error}");
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.0,
        ),
        child: SingleChildScrollView(
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
                  'Add Description for $locationLabel',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      final description = descriptionController.text.trim();
                      print(description);
                      final cleanedLocationLabel = (locationLabel).replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
                      print(cleanedLocationLabel);

                      context.read<HomeBloc>().add(AddFavouriteListRequested(
                        title: cleanedLocationLabel,
                        description: description,
                      ));
                    },

                    child: custombutton(text: "Save"),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

