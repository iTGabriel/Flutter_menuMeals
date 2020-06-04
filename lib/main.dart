import 'package:flutter/material.dart';
// import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/categories_meal_detail_screen.dart';
import 'screens/tabs_screens.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.black,
        fontFamily: 'DancingScript',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(fontFamily: 'Raleway', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
        )
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (_) => TabApp(),
        AppRoutes.CARDAPIO_MENU: (_) => CategoryMealsScreen(),
        AppRoutes.DETALHE_REFEICAO: (_) => MealDetail(),
      }
    );
  }
}