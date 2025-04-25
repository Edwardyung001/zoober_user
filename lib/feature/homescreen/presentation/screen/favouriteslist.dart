import 'package:flutter/material.dart';
import 'package:zoober_user_ride/core/utils/custombutton.dart';
import 'package:zoober_user_ride/feature/homescreen/presentation/screen/favourites.dart';

import '../../../../core/constants/routing.dart';



class FavoritesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Favourites'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFavoriteItem('Home', Icons.home),
            _buildFavoriteItem('Work', Icons.work),
            _buildFavoriteItem('Gym', Icons.fitness_center),
            _buildFavoriteItem('College', Icons.school),
            _buildFavoriteItem('Hostel', Icons.domain),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  navigateTo(context, NewFavourites());
                },
                child: _buildAddNewButton()),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteItem(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle:
        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewButton() {
    return custombutton(text: "Add New");
  }
}
