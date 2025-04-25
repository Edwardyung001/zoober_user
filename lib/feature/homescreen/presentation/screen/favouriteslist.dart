import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoober_user_ride/core/storage/local_storage.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/bloc/home_bloc.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/favourites.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/settings.dart';
import '../../../../core/constants/routing.dart';


class FavoritesListScreen extends StatefulWidget {
  @override
  State<FavoritesListScreen> createState() => _FavoritesListScreenState();
}

class _FavoritesListScreenState extends State<FavoritesListScreen> {
  @override
  void initState() {
    super.initState();
    fetching();
  }

  void fetching() async {
    final userId = await SecureStorage.getValue('userId');
    if (userId != null) {
      context.read<HomeBloc>().add(FetchingFavouriteRequested(userId: userId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favourites'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate to FavoritesListScreen and remove current screen from stack
            navigateTo(context, SettingsPage());
          },
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          } else if (state is DeleteFavouriteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Favourite deleted successfully!")),
            );

            // You can trigger fetching favourites again after successful deletion.
            fetching();
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          }
                    else if (state is FetchingFavouriteSuccess) {
            // Filter out deleted favourites
            final activeFavourites = state.favouriteList
                .where((fav) => fav['deleted_at'] == null) // Access `deleted_at` from the map
                .toList();
             print(activeFavourites);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ...activeFavourites.map((fav) => _buildFavoriteItem(fav)),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      navigateTo(context, NewFavourites());
                    },
                    child: _buildAddNewButton(),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No favourites found.'));
          }
        },
      ),
    );
  }

  Widget _buildFavoriteItem(dynamic fav) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(_getIconForTitle(fav['title'])),
        title: Text(fav['title'] ?? ''),
        subtitle: Text(fav['description'] ?? ''),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Open bottom sheet to edit the description
                _openEditBottomSheet(context, fav);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final id = fav['id'];
                context.read<HomeBloc>().add(DeleteFavouriteRequested(id: id));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _openEditBottomSheet(BuildContext context, dynamic fav) {
    TextEditingController descriptionController = TextEditingController(
      text: fav['description'] ?? '', // Set initial value as current description
    );

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeLoading) {
              Center(child: CircularProgressIndicator());
            } else if (state is FavouriteSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              fetching();
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
                    'Edit Description for ${fav['title']}',
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
                        // final updatedDescription = descriptionController.text.trim();
                        // print(updatedDescription);
                        //
                        // context.read<HomeBloc>().add(AddFavouriteListRequested(
                        //   title: fav['title'],
                        //   description: updatedDescription,
                        // ));
              
                        // Close the bottom sheet and show a success message
                        Navigator.pop(context);
                      },
                      child: custombutton(text: "Save"), // You can customize the button style further if needed
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  IconData _getIconForTitle(String title) {
    switch (title.toLowerCase()) {
      case 'home':
        return Icons.home;
      case 'work':
        return Icons.work;
      case 'gym':
        return Icons.fitness_center;
      case 'college':
        return Icons.school;
      case 'hostel':
        return Icons.domain;
      default:
        return Icons.place;
    }
  }

  Widget _buildAddNewButton() {
    return custombutton(text: "Add New");
  }
}