import 'package:flutter/material.dart';

import './pages/category_meal_page.dart';
import './pages/meal_detail.dart';
import './pages/tabs_page.dart';
import './pages/filters_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '点单系统',
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
        '/': (ctx) => TabsPage(), //默认 / 标识主页
        CategoryMealPage.routeName: (ctx) => CategoryMealPage(),
        MealDetail.routeName: (ctx) => MealDetail(),
        FiltersPage.routeName: (ctx) => FiltersPage(),
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
              '点单系统',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
