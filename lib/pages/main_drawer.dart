import 'package:flutter/material.dart';
import '../pages/filters_page.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTileItem(
      IconData iconData, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "RobotoCondensed"),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            height: 120,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            child: Text("dish setting",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w900)),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTileItem(Icons.restaurant, "meal", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(
            height: 20,
          ),
          buildListTileItem(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
          }),
        ],
      ),
    );
  }
}
