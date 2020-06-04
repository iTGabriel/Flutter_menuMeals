import 'package:flutter/material.dart';

class FavoriteMeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text("Refeições favoritas!", style: Theme.of(context).textTheme.headline6.apply(color: Colors.black),),
    );
  }
}