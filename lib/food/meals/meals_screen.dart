import 'package:flutter/material.dart';
import '../../models/meals.dart';
import './meals_item.dart';

class MealsScreen extends StatefulWidget {
  static String routeName = "/meals_screen";

  MealsScreen(this.dummyMeals);
  final List<Meal> dummyMeals;
  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
    // final params = ModalRoute.of(context).settings.arguments as Map;
    // final categoryId = params['id'];
    // categoryTitle = params['title'];
    // displayedMeals = DUMMY_MEALS
    //     .where((meals) => meals.categories.contains(categoryId))
    //     .toList();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final params = ModalRoute.of(context).settings.arguments as Map;
    final categoryId = params['id'];
    categoryTitle = params['title'];
    displayedMeals = widget.dummyMeals
        .where((meals) => meals.categories.contains(categoryId))
        .toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(categoryTitle),
        ),
        body: Container(
          // color: categoryColor,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var eachMeal = displayedMeals[index];
              return MealsItem(
                  id: eachMeal.id,
                  title: eachMeal.title,
                  imageUrl: eachMeal.imageUrl,
                  duration: eachMeal.duration,
                  affordability: eachMeal.affordability,
                  complexity: eachMeal.complexity,
                  removeItem: _removeMeal);
            },
            itemCount: displayedMeals.length,
            // itemExtent: 10,
          ),
        ));
  }
}
