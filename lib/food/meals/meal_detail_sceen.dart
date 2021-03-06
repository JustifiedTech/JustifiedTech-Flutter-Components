import 'package:flutter/material.dart';
import '../../config/size_config.dart';

import '../../data/dummy_data.dart';
import '../../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';

  const MealDetailScreen(this._isFavourite, this._toggleFavorite);

  final Function _isFavourite, _toggleFavorite;

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;

    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Get.back();
            Navigator.of(context).pop(mealId);
          },
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColor,
          ),
        ),
        appBar: AppBar(
          title: Text(selectedMeal.title),
          centerTitle: true,
          actions: [
            IconButton(
              color: Theme.of(context).accentColor,
              iconSize: 30,
              padding: const EdgeInsets.only(right: 10),
              onPressed: () => _toggleFavorite(mealId),
              icon: _isFavourite(mealId)
                  ? Icon(Icons.favorite_outlined)
                  : Icon(Icons.favorite_border_sharp),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor),
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(5),
                height: getPercentageScreenHeight(40),
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: CircleBorder(
                    side: BorderSide.none,
                  )),
                  child: Image.asset(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              titleTile(context, 'Ingredients'),
              sectionBuild(
                  context,
                  GridView.builder(
                      itemCount: selectedMeal.ingredients.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 5,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        maxCrossAxisExtent: 350,
                      ),
                      itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 3,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_right_outlined),
                              // SizedBox(width: 10),
                              Text(
                                selectedMeal.ingredients[index],
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ],
                          )))),
              titleTile(context, 'How to Prepare'),
              sectionBuild(
                  context,
                  GridView.builder(
                      itemCount: selectedMeal.steps.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 5,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        maxCrossAxisExtent: 400,
                      ),
                      itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 3,
                          child: ListTile(
                            leading: CircleAvatar(child: Text('${index + 1}')),
                            title: Text(
                              selectedMeal.steps[index],
                              softWrap: true,
                            ),
                          )))),
            ],
          ),
        ));
  }

  Widget titleTile(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
          fontSize: getProportionateScreenWidth(20),
        ),
      ),
    );
  }

  Widget sectionBuild(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Theme.of(context).accentColor,
            width: 2,
          )),
      height: 300,
      child: child,
    );
  }
}
