import 'package:flutter/material.dart';
import '/models/meals.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favourites';

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<Meal> favourites = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: favourites.isEmpty
          ? Text('You currently do not have any favourites')
          : CircularProgressIndicator(
              color: Theme.of(context).accentColor,
            ),
    );
  }
}
