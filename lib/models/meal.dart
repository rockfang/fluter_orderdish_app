import 'package:flutter/foundation.dart';

enum Affordability { Affordable, Pricey, Luxurious }

enum Complexity { Simple, Challenging, Hard }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;

  final bool isGlutenFree;//不含麸质
  final bool isVegan;//严格的素食主义者
  final bool isVegetarian;//普通的素食主义者
  final bool isLactoseFree;//去乳糖饮食

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.affordability,
      @required this.complexity,
      @required this.imageUrl,
      @required this.duration,
      @required this.ingredients,
      @required this.steps,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.isLactoseFree});
}
