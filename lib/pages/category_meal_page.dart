import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class CategoryMealPage extends StatelessWidget {
  // final String id;
  // final String title;
  // const CategoryMealPage(this.id,this.title);
  static final routeName = '/category-meal';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String title = routeArgs['title'];
    //获取该分类下的meal数组
    List<Meal> meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeArgs['id']);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: meals[index].id,
              title: meals[index].title,
              duration: meals[index].duration,
              complexity: meals[index].complexity,
              affordability: meals[index].affordability,
            );
          },
        )
        );
  }
}
