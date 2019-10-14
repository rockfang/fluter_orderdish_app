import 'package:flutter/material.dart';

class CategoryMealPage extends StatelessWidget {
  // final String id;
  // final String title;
  // const CategoryMealPage(this.id,this.title);
  static final routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
final String title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Center(child: const Text("菜品列表")),
      ),
    );
  }
}
