import 'package:flutter/material.dart';
import '../nav/drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settings_screen";

  SettingsScreen(this.currentFilters, this.saveFilters);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['isGlutenFree'];
    _isVegan = widget.currentFilters['isVegan'];
    _isVegetarian = widget.currentFilters['isVegetarian'];
    _isLactoseFree = widget.currentFilters['isLactoseFree'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> filters = {
                  'isGlutenFree': _isGlutenFree,
                  'isVegan': _isVegan,
                  'isVegetarian': _isVegetarian,
                  'isLactoseFree': _isLactoseFree
                };

                widget.saveFilters(filters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              child: Text('Adjust Meal selection'),
            ),
            swithListTile(
                'Gluten-free', 'Only include gluten-free meals.', _isGlutenFree,
                (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            }),
            swithListTile('Vegan', 'Only include vegan meals.', _isVegan,
                (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            }),
            swithListTile('Lactose-free', 'Only include lactose-free meals.',
                _isLactoseFree, (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            }),
            swithListTile(
                'Vegetarian', 'Only include vegetarian meals.', _isVegetarian,
                (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            }),
          ],
        ),
      ),
    );
  }

  SwitchListTile swithListTile(
      String title, String description, bool value, Function press) {
    return SwitchListTile.adaptive(
        selectedTileColor: Colors.purple,
        activeColor: Theme.of(context).accentColor,
        title: Text(title),
        subtitle: Text(description),
        value: value,
        onChanged: press);
  }
}
