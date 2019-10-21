import 'package:flutter/material.dart';
import '../pages/category_list_page.dart';
import '../pages/favorite_tab_page.dart';
import '../pages/main_drawer.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsPage(this.favoriteMeals);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> tabPages;
  int _selectIndex = 0;
  void _selectTabBar(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  void initState() {
    tabPages = [
      {'page': CategoryListPage(), 'title': '分类页'},
      {'page': FavoriteTabPage(widget.favoriteMeals), 'title': '收藏页'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tabPages[_selectIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: tabPages[_selectIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          //type:BottomNavigationBarType.shifting,
          currentIndex: _selectIndex,
          onTap: _selectTabBar, //默认会传索引值过去
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("分类列表"),
            ),
            BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text("我的收藏"),
            ),
          ],
        ));
  }
}
