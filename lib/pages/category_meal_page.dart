import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealPage extends StatefulWidget {
  // final String id;
  // final String title;
  // const CategoryMealPage(this.id,this.title);
  static final routeName = '/category-meal';
  final List<Meal> availableMeals;
  CategoryMealPage(this.availableMeals);
  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  Map<String, String> routeArgs;
  String title;
  List<Meal> meals;
  var isInitialized = false;

  void _removeMeal(String id) {
    setState(() {
      meals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      //获取该分类下的meal数组
      meals = widget.availableMeals.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      isInitialized = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
              imageUrl: meals[index].imageUrl,
              duration: meals[index].duration,
              complexity: meals[index].complexity,
              affordability: meals[index].affordability,
            );
          },
        ));
  }
}
