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
    final pessoaService = PessoaService();

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
              return Container(
                height: 80,
                width: 200,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //border: Border.all(color: Colors.red),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('First Name: ' + listagem[index].firstnome),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Second Name: ' + listagem[index].firstnome),
                      ],
                    ),
                    FlatButton(
                      color: Colors.blueGrey,
                      onPressed: () {
                        var pessoa = Pessoa(
                          id: listagem[index].id,
                          firstnome: listagem[index].firstnome,
                          secondname: listagem[index].secondname,
                        );
                        pessoaService.deleteDataPessoa(pessoa);
                        setState(() {});
                      },
                      child: Text(
                        'Excluir o registro',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
