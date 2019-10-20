import 'package:flutter/material.dart';
import '../pages/main_drawer.dart';

class FiltersPage extends StatelessWidget {
  static final routeName = 'filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters"),
      ),
      body: Center(
        child: Text("filters"),
      ),
      drawer: MainDrawer(),
    );
  }
}
