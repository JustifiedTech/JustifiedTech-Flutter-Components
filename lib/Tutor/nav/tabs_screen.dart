import 'package:flutter/material.dart';
import '../category/categories_screen.dart';
import '../category/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int get tabIndex => tabController.index;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(tabIndex.toString());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (tabIndex == 0) {
            tabController.animateTo(1);
          } else {
            tabController.animateTo(0);
          }
        },
        child: tabIndex == 0
            ? Icon(Icons.arrow_forward_ios)
            : Icon(Icons.arrow_back_ios),
      ),
      appBar: AppBar(
        title: Text('Delicious Measl'),
        centerTitle: true,
        bottom: TabBar(controller: tabController, tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.star),
          )
        ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [CategoryScreen(), FavouriteScreen()],
      ),
    );
  }
}
