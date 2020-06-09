import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class DrawerMain extends StatelessWidget{

  Widget build(BuildContext context){

  _drawerOptionSelectScreen(Icon icone, String titulo, Function screenMove ){
    return ListTile(
      leading: icone,
      title: Text(titulo),
      onTap:  screenMove,
      );
  }
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text("Receitas - Flutter App",
            style: Theme.of(context).textTheme.headline6.apply(fontSizeDelta: 5))),
            SizedBox(height: 10),
            
            _drawerOptionSelectScreen(
              Icon(Icons.restaurant, color: Theme.of(context).primaryColor), "Refeições", (){Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);}
            ),

            _drawerOptionSelectScreen(
              Icon(Icons.settings, color: Theme.of(context).primaryColor), "Configurações", (){Navigator.of(context).pushReplacementNamed(AppRoutes.CONFIGURACOES);}
            ),

        ],
      ),
    );
  }
}