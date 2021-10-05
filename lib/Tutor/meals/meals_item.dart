import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justifiedtech/config/size_config.dart';
import 'package:justifiedtech/models/meals.dart';

import 'meal_detail_sceen.dart';

class MealsItem extends StatelessWidget {
  const MealsItem(
      {@required this.title,
      @required this.id,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration});

  final String title, id, imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'Simple';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return '50';
        break;
      case Affordability.Luxurious:
        return '150';
        break;
      case Affordability.Pricey:
        return '100';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal() {
    Get.toNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onTap: selectMeal,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace stackTrace) {
                        return Placeholder();
                      },
                    )),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: getPercentageScreenWidth(70),
                    color: Theme.of(context).primaryColor.withOpacity(0.48),
                    child: Text(title,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(20),
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule_sharp),
                        SizedBox(width: 10),
                        Text('$duration min')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work_sharp),
                        SizedBox(width: 10),
                        Text(complexityText)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money_sharp),
                        SizedBox(width: 10),
                        Text(affordabilityText)
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
