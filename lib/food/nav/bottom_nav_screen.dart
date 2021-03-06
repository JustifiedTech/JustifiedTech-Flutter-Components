import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/meals.dart';
import '../nav/drawer.dart';
import '../category/favourites_screen.dart';
import '../category/categories_screen.dart';

class BottomNavScreen extends StatefulWidget {
  static const routeName = '/bottom_nav';

  BottomNavScreen(this.favouriteMeals);

  final List<Meal> favouriteMeals;
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  List<Map<String, dynamic>> _pages;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _pages = [
      {'page': CategoryScreen(), 'title': 'All Meal Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourites'}
    ];
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      // drawerScrimColor: Colors.red,
      drawerDragStartBehavior: DragStartBehavior.start,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pages[_selectedIndex]['title'],
        ),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        // type: BottomNavigationBarType.,
        unselectedFontSize: 10,
        unselectedIconTheme: IconThemeData(size: 20),
        selectedIconTheme: IconThemeData(size: 30),
        selectedLabelStyle: TextStyle(fontStyle: FontStyle.italic),
        onTap: _selectedPage,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'All Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline_rounded), label: 'Favourites'),
        ],
      ),
    );
  }
}
