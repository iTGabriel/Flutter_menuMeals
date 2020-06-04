import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_meals_screen.dart';


class TabApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Receitas Flutter'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Categorias",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favoritos",
            ),
          ]),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoriteMeals()]),
      ),
    );
  }
}
