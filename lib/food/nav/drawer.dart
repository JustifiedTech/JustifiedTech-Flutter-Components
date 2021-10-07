import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justifiedtech/config/size_config.dart';
import '../nav/bottom_nav_screen.dart';
import '../settings/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context)
                      .accentColor), // curve: Curves.bounceInOut,
              child: Text(
                'Delicious Meals',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20)),
              ),
            ),
          ),
          buildListTile('Meals', Icons.restaurant, () {
            // ignore: unnecessary_statements
            Get.offNamed(BottomNavScreen.routeName);
          }),
          Divider(color: Theme.of(context).accentColor),
          buildListTile('Settings', Icons.settings, () {
            // ignore: unnecessary_statements
            Get.offNamed(SettingsScreen.routeName);
          }),
          Divider(color: Theme.of(context).accentColor)
        ],
      ),
    );
  }

  ListTile buildListTile(String text, IconData icon, Function tap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
      ),
      onTap: tap,
    );
  }
}
