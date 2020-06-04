import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Meal meal = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
            child: Text("Ingredientes", style: Theme.of(context).textTheme.headline6.apply(color: Colors.black)),
            padding: EdgeInsets.all(10),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                ),
              height: 250,
              width: 300,
              child: ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {

                return Container(
                  child: Card(
                    color: Colors.red[400],
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(meal.ingredients[index], style: Theme.of(context).textTheme.headline6),
                    )),
                );

              }),
              )

          ],

        ),
      ),
    );
  }
}