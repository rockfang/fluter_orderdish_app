import 'package:flutter/material.dart';
import '../pages/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static final routeName = 'filters';
  Function saveFilters;
  Map<String, bool> _filters;
  FiltersPage(this._filters, this.saveFilters);
  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget._filters['gluten'];
    isVegan = widget._filters['vergan'];
    isVegetarian = widget._filters['vegetarian'];
    isLactoseFree = widget._filters['lactose'];
    super.initState();
  }

  Widget buildSwitchFilterItem(
      String title, String subtitle, bool switchValue, Function changeSwitch) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: switchValue,
        onChanged: changeSwitch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': isGlutenFree,
                'vergan': isVegan,
                'vegetarian': isVegetarian,
                'lactose': isLactoseFree,
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Adjust your meal filters",
              style: Theme.of(context).textTheme.title,
            ),
            margin: EdgeInsets.all(20),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchFilterItem("不含麸质", "开启后将含麸质菜品", isGlutenFree, (value) {
                setState(() {
                  isGlutenFree = value;
                });
              }),
              buildSwitchFilterItem("严格素食主义", "开启后将过滤肉、奶类菜品", isVegan, (value) {
                setState(() {
                  isVegan = value;
                });
              }),
              buildSwitchFilterItem("素食主义", "开启后将过滤肉类菜品", isVegetarian,
                  (value) {
                setState(() {
                  isVegetarian = value;
                });
              }),
              buildSwitchFilterItem("去乳糖", "开启后将过滤含乳糖类菜品", isLactoseFree,
                  (value) {
                setState(() {
                  isLactoseFree = value;
                });
              }),
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
