import 'package:flutter/material.dart';
import '../meals/meals_screen.dart';
import 'package:get/get.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({Key key, this.title, this.color, this.id})
      : super(key: key);

  final String id;
  final String title;
  final Color color;

  void _selectedItem() {
    Get.toNamed(MealsScreen.routeName,
        arguments: {'id': id, 'title': title, 'color': color});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        splashColor: Theme.of(context).primaryColor,
        onTap: _selectedItem,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
