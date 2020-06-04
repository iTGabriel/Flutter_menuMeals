import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_meals_screen.dart';

class TabApp extends StatefulWidget {
  @override
  _TabAppState createState() => _TabAppState();
}

class _TabAppState extends State<TabApp> {
  int _screenIndex = 0;
  final List _screenWidgets = [CategoriesScreen(), FavoriteMeals()];

  _selectedScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Receitas Flutter', style: TextStyle(fontSize: 36)),
      ),
      body: Center(
        child: _screenWidgets[_screenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _screenIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                title: Text("Categorias",)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                ),
                title: Text("Favoritos")),
          ]),
    );
  }
}
