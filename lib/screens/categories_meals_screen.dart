import 'package:flutter/material.dart';
import '../models/category.dart';


class CategoryMealsScreen extends StatelessWidget {

  final Category categoria;

  const CategoryMealsScreen(
  this.categoria
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria.title, style: TextStyle(fontSize: 35),),),
      body: Center(
        child: Text(categoria.title),
      ),
    );
  }
}
