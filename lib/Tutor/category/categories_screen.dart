import 'package:flutter/material.dart';
import 'package:justifiedtech/config/size_config.dart';
import 'package:justifiedtech/data/dummy_data.dart';

import 'category_item.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
              // mainAxisExtent: 100,
          maxCrossAxisExtent: 300,
        ),
            children: DUMMY_CATEGORIES
            .map(
              (category) => CategoryItem(
                title: category.title,
                id: category.id,
                color: category.color,
              ),
                )
            .toList(),
      ),
    );
  }
}
