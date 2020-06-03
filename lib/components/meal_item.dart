import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  void _selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 5,
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(meal.title, 
                      style: Theme.of(context).textTheme.headline6.apply(fontSizeDelta: 5, backgroundColor: Color.fromRGBO(0, 0, 0, 0.3)), 
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  
                  Row(children: <Widget>[
                      Icon(Icons.access_time),
                      Text("${meal.duration.toString()} min")
                    ],
                  ),

                  Row(children: <Widget>[
                      Icon(Icons.work),
                      Text(" ${meal.mealComplexity}"),
                    ],
                  ),

                  Row(children: <Widget>[
                      Icon(Icons.attach_money),
                      Text(" ${meal.MealCost}")
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
