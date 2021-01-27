import 'package:flutter/material.dart';
import 'package:flutter_floor_crud/entity/pessoa.dart';
import 'package:flutter_floor_crud/service/pessoa_service.dart';

class Listagem extends StatefulWidget {
  @override
  _ListagemState createState() => _ListagemState();
}

class _ListagemState extends State<Listagem> {
  PessoaService lista = PessoaService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor CRUD - Register'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Pessoa>>(
        future: lista.listaDataPessoa(),
        initialData: List<Pessoa>(),
        builder: (BuildContext context, AsyncSnapshot<List<Pessoa>> snapshot) {
          if (!snapshot.hasData) {
            CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            CircularProgressIndicator();
          }
          var listagem = snapshot.data;
          return ListView.builder(
            itemCount: listagem.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Text(listagem[index].firstnome),
              );
            },
          );
        },
      ),
    );
  }
}
