import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {@required this.id,
      @required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexText {
    switch (complexity) {
      case Complexity.Simple:
        return "简单";
        break;
      case Complexity.Challenging:
        return "正常";
        break;
      case Complexity.Hard:
        return "困难";
        break;
      default:
        return "未知";
    }
  }
   String get affordText {
    switch (affordability) {
      case Affordability.Affordable:
        return "便宜";
        break;
      case Affordability.Pricey:
        return "正常";
        break;
      case Affordability.Luxurious:
        return "奢侈";
        break;
      default:
        return "未知";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      width: 300,
                      color: Colors.black45,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    ),
                    bottom: 10,
                    right: 10,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.schedule,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        FittedBox(child: Text('$duration 分钟',style: TextStyle(fontFamily: "")))//去掉字体，处理显示数字大小不一致问题。
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.work,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexText)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordText)
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
