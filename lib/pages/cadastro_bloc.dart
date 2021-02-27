import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floor_crud/bloc/databloc.dart';
import 'package:flutter_floor_crud/pages/cadbloc/cadastro.dart';

class CadastroBloc extends StatefulWidget {
  @override
  _CadastroBlocState createState() => _CadastroBlocState();
}

class _CadastroBlocState extends State<CadastroBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataBloc>(
      create: (context) => DataBloc(),
      child: MaterialApp(
        home: Cadastro(),
      ),
    );
  }
}
