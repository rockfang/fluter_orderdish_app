import 'package:flutter/material.dart';
import '../category_meal_page.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;
  const CategoryItem({@required this.id, @required this.title, this.bgColor = Colors.blue});
  void selectCategoryItem(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealPage(id,title);
    // }));
    Navigator.of(ctx).pushNamed(CategoryMealPage.routeName,arguments: {
      "id": id,
      "title": title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategoryItem(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [bgColor, bgColor.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
