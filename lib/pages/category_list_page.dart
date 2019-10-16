import 'package:flutter/material.dart';
// import '../models/dummy_category.dart';
import '../dummy-data.dart';
import '../widgets/category_item.dart';
class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("菜系列表")),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((ct) => CategoryItem(
                  id: ct.id,
                  title: ct.title,
                  bgColor: ct.color,
                ))
            .toList(),
      ),
    );
  }
}
