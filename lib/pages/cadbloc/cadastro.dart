import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floor_crud/bloc/databloc.dart';
import 'package:flutter_floor_crud/bloc/dataevent.dart';
import 'package:flutter_floor_crud/bloc/datastate.dart';
import 'package:flutter_floor_crud/entity/pessoa.dart';
import 'package:flutter_floor_crud/service/pessoa_service.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  //GlobalKey
  final _formKey = GlobalKey<FormState>();
  final firstnamecontroller = TextEditingController();
  final secondnamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataBloc = BlocProvider.of<DataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor CRUD - Register'),
        centerTitle: true,
      ),
      body: BlocListener<DataBloc, DataState>(
        listener: (context, state) {
          if (state is Success) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('Success'),
              ),
            );
          }
        },
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is Initial) {
              return Container(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'First name',
                          labelText: 'First name',
                        ),
                        controller: firstnamecontroller,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your firt name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Second name',
                          labelText: 'Second name',
                        ),
                        controller: secondnamecontroller,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your second name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            //_cadastrarPessoa();
                            //Navigator.of(context).pop();
                            Pessoa pessoa = Pessoa(
                              firstnome: firstnamecontroller.text,
                              secondname: secondnamecontroller.text,
                            );
                            dataBloc.add(FetchData(pessoa));
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              return Center(child: Text('Success'));
            }
            return Container();
          },
        ),
      ),
    );
  }

  /*_cadastrarPessoa() async {
    final pessoaService = PessoaService();
    final pessoa = Pessoa(
      firstnome: firstnamecontroller.text,
      secondname: secondnamecontroller.text,
    );
    bool result = await pessoaService.insertDataPessoa(pessoa);
    print(result);
  }*/

  _body() {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'First name',
                labelText: 'First name',
              ),
              controller: firstnamecontroller,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your firt name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Second name',
                labelText: 'Second name',
              ),
              controller: secondnamecontroller,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your second name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  //_cadastrarPessoa();
                  //Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
