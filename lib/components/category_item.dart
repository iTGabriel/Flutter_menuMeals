import 'package:flutter/material.dart';
import '../models/category.dart';

// import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category categoria;

  CategoryItem({@required this.categoria});

  _selectCategory(BuildContext context){
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_){
    //     return CategoryMealsScreen();
    //     })
    // );
    Navigator.of(context).pushNamed('/cardapio-menu', arguments: categoria);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(categoria.title, style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [categoria.color, categoria.color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)),
      ),
    );
  }
}
