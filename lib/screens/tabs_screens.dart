import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_meals_screen.dart';
import './drawerMain.dart';

class TabApp extends StatefulWidget {
  @override
  _TabAppState createState() => _TabAppState();
}

class _TabAppState extends State<TabApp> {

  int _screenIndex = 0;
  final List<Map> _screenWidgets = [
    { 'title': 'Categorias', 'screen': CategoriesScreen()},
    { 'title': 'Favoritos', 'screen': FavoriteMeals()},
      ];

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
        title: Text(_screenWidgets[_screenIndex]['title'], style: TextStyle(fontSize: 36)),
      ),
      drawer: DrawerMain(),
      body: Center(
        child: _screenWidgets[_screenIndex]['screen'],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedScreen,
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).accentColor,
          currentIndex: _screenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text("Categorias",)),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text("Favoritos")),
          ]),
    );
  }
}
