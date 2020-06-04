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
          centerTitle: true,
          title: Text('Receitas Flutter', style: TextStyle(fontSize: 36),),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              child: Text("Categorias", style:  TextStyle(fontSize: 20)),
            ),
            Tab(
              icon: Icon(Icons.star),
              child: Text("Favoritos", style:  TextStyle(fontSize: 20))
            ),
          ]),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoriteMeals()]),
      ),
    );
  }
}
