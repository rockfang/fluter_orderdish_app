import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static final String routeName = "/meal-detail";
  @override
  Widget build(BuildContext context) {
     final String id  = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("detail page"),
      ),
      body: Center(
        child: Text("$id 详情页"),
      ),
    );
  }
}
