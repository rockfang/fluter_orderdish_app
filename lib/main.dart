import 'package:fluter_orderdish_app/dummy-data.dart';
import 'package:flutter/material.dart';

import './pages/category_meal_page.dart';
import './pages/meal_detail.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vergan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favoriteMeals = [];

  void toggleFavoriteMeal(String id) {
    int existIndex = favoriteMeals.indexWhere((meal) => meal.id == id);
    setState(() {
      if (existIndex >= 0) {
        favoriteMeals.removeAt(existIndex);
      } else {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      }
    });
  }

  bool isFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  void saveFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filters['gluten']) {
          return false;
        }
        if (!meal.isVegan && _filters['vergan']) {
          return false;
        }
        if (!meal.isVegetarian && _filters['vegetarian']) {
          return false;
        }
        if (!meal.isLactoseFree && _filters['lactose']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '菜品百科',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
                fontSize: 20.0,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),
      ),
      //home: CategoryListPage(),
      initialRoute: '/', //也可以指定非'/'的默认路由名
      routes: {
        '/': (ctx) => TabsPage(favoriteMeals), //默认 / 标识主页
        CategoryMealPage.routeName: (ctx) => CategoryMealPage(availableMeals),
        MealDetail.routeName: (ctx) =>
            MealDetail(isFavorite, toggleFavoriteMeal),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, saveFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '菜谱系统',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
