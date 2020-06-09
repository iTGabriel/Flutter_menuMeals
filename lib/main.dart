import 'package:cardapio/data/dummy_data.dart';
import 'models/settings.dart';
import 'package:flutter/material.dart';
// import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/categories_meal_detail_screen.dart';
import 'screens/tabs_screens.dart';
import 'screens/configuracoes_screen.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings configuracoes = Settings();
  List _avaibleMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings){
    setState((){
      configuracoes = settings;
      _avaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }
      ).toList();
    });
  }

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
        ),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        AppRoutes.HOME: (_) => TabApp(),
        AppRoutes.CARDAPIO_MENU: (_) => CategoryMealsScreen(_avaibleMeals),
        AppRoutes.DETALHE_REFEICAO: (_) => MealDetail(),
        AppRoutes.CONFIGURACOES: (_) => ConfiguracoesApp(configuracoes ,_filterMeals)
      }
    );
  }
}