import 'package:flutter/material.dart';
import 'package:justifiedtech/Tutor/meals/meals_item.dart';
import 'package:justifiedtech/data/dummy_data.dart';

class MealsScreen extends StatefulWidget {
  static String routeName = "/meals_screen";

  MealsScreen({Key key}) : super(key: key);

  @override
  _MealsScreenState createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context).settings.arguments as Map;
    final String categoryId = params['id'];
    final String categoryTitle = params['title'];
    // final String categoryColor = params['color'];
    final mealsCategory = DUMMY_MEALS
        .where((meals) => meals.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(categoryTitle),
        ),
        body: Container(
          // color: categoryColor,
          child: ListView.builder(
            itemBuilder: (context, index) {
              var eachMeal = mealsCategory[index];
              return MealsItem(
                  id: eachMeal.id,
                  title: eachMeal.title,
                  imageUrl: eachMeal.imageUrl,
                  duration: eachMeal.duration,
                  affordability: eachMeal.affordability,
                  complexity: eachMeal.complexity);
            },
            itemCount: mealsCategory.length,
            // itemExtent: 10,
          ),
        ));
  }
}
