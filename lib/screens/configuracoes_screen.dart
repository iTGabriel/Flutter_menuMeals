import 'package:flutter/material.dart';
import './drawerMain.dart';
import '../models/settings.dart';

class ConfiguracoesApp extends StatefulWidget {

  final Settings configuracoes;
  final Function(Settings) onSettingsChanged;

  const ConfiguracoesApp(this.configuracoes, this.onSettingsChanged);

  @override
  _ConfiguracoesAppState createState() => _ConfiguracoesAppState();
}

class _ConfiguracoesAppState extends State<ConfiguracoesApp> {
  
  Settings configuracoes;

  void initState(){
    super.initState();
    configuracoes = widget.configuracoes;
  }



  _switchOptionConfig(
      String title, String subtitle, bool value, Function onChanged) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        activeColor: Theme.of(context).primaryColor,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(configuracoes);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações", style: TextStyle(fontSize: 36)),
      ),
      drawer: DrawerMain(),
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          Container(
              child: Text(
            "Configurações",
            style: TextStyle(fontSize: 16),
          )),
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchOptionConfig(
                    "Glútem",
                    "Alimentos com gluten",
                    configuracoes.isGlutenFree,
                    (value) =>
                        setState(() => configuracoes.isGlutenFree = value)),
                _switchOptionConfig(
                    "Lactose",
                    "Alimentos com lactose",
                    configuracoes.isLactoseFree,
                    (value) =>
                        setState(() => configuracoes.isLactoseFree = value)),
                _switchOptionConfig(
                    "Vegano",
                    "Alimentos vegano",
                    configuracoes.isVegan,
                    (value) => setState(() => configuracoes.isVegan = value)),
                _switchOptionConfig(
                    "Vegetariano",
                    "Alimentos vegetariano",
                    configuracoes.isVegetarian,
                    (value) =>
                        setState(() => configuracoes.isVegetarian = value)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
