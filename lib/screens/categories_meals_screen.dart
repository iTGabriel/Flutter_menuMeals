import 'package:cardapio/data/dummy_data.dart';
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final Category categoria = ModalRoute.of(context).settings.arguments;

    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoria.id);
      }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoria.title, style: TextStyle(fontSize: 35),),),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        }),
        );
    // );
  }
}
