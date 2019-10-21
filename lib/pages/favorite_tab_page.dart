import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteTabPage extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteTabPage(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(child:Text("您还没有菜品加入收藏!"))
        : ListView(
            children: favoriteMeals
                .map((meal) => MealItem(
                      id: meal.id,
                      title: meal.title,
                      imageUrl: meal.imageUrl,
                      duration: meal.duration,
                      affordability: meal.affordability,
                      complexity: meal.complexity,
                    ))
                .toList(),
          );
  }
}
