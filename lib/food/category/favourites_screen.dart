
import 'package:flutter/material.dart';
import 'package:justifiedtech/food/meals/meals_item.dart';
import '/models/meals.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = '/favourites';
  FavouriteScreen(this.favouriteMeals);
  final List<Meal> favouriteMeals;

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

   void _removeMeal(String mealId) {
    setState(() {
      widget.favouriteMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return widget.favouriteMeals.isEmpty
        ? Center(child: Text('You currently do not have any favourites'))
        : Container(
            // color: categoryColor,
            child: ListView.builder(
              itemBuilder: (context, index) {
                var eachMeal = widget.favouriteMeals[index];
                return MealsItem(
                    id: eachMeal.id,
                    title: eachMeal.title,
                    imageUrl: eachMeal.imageUrl,
                    duration: eachMeal.duration,
                    affordability: eachMeal.affordability,
                    complexity: eachMeal.complexity,
                    removeItem: _removeMeal);
              },
              itemCount: widget.favouriteMeals.length,
              // itemExtent: 10,
            ),
              
    );
  }
}
