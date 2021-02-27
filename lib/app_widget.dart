import 'package:flutter/material.dart';
import 'package:flutter_floor_crud/pages/cadastro.dart';
import 'package:flutter_floor_crud/pages/cadastro_bloc.dart';
import 'package:flutter_floor_crud/pages/home_page.dart';
import 'package:flutter_floor_crud/pages/listagem.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floor CRUD',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
        accentColorBrightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: CadastroBloc(),
      routes: <String, WidgetBuilder>{
        '/cadastro': (BuildContext context) => new Cadastro(),
        '/listagem': (BuildContext context) => new Listagem(),
      },
    );
  }
}
