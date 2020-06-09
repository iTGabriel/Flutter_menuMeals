import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetail extends StatelessWidget {
  final Function titleDetail = (BuildContext context, String textoTitle) {
    return Container(
        child: Text(textoTitle,
            style: Theme.of(context)
                .textTheme
                .headline6
                .apply(color: Colors.black)),
        padding: EdgeInsets.all(10));
  };

  final Function listDetail = (BuildContext context, Meal meal, Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(top: 5, bottom: 5),
        height: 250,
        width: 300,
        child: child);
  };

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
            this.titleDetail(context, "Ingrediente"),
            listDetail(
                context,
                meal,
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                            color: Theme.of(context).primaryColor,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(meal.ingredients[index],
                                  style: Theme.of(context).textTheme.headline6),
                            )),
                      );
                    })),
            this.titleDetail(context, "Passos"),
            listDetail(
                context,
                meal,
                ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Card(
                              color: Theme.of(context).primaryColor,
                              elevation: 5,
                              child: ListTile(
                                leading: CircleAvatar(
                                    child: Text("${index + 1}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .apply(color: Colors.black)),
                                    backgroundColor: Colors.white),
                                title: Text(meal.steps[index],
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              )),
                          Divider(color: Theme.of(context).primaryColor),
                        ],
                      );
                    })),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).pop(meal),
      child: Icon(Icons.star),),
    );
  }
}
