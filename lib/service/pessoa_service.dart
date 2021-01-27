import 'package:flutter_floor_crud/database/database.dart';
import 'package:flutter_floor_crud/entity/pessoa.dart';

class PessoaService {
  SystemDatabase dao;

  Future<SystemDatabase> _iniDB() async {
    return $FloorSystemDatabase.databaseBuilder('app_database.db').build();
  }

  Future<bool> insertDataPessoa(Pessoa pessoa) async {
    var result;
    try {
      dao = await _iniDB();
      result = await dao.pessoaDao.insertPerson(pessoa) > 0 ? true : false;
    } catch (e) {
      result = false;
    }
    return result;
  }

  Future<bool> updateDataPessoa(Pessoa pessoa) async {
    var result;
    try {
      dao = await _iniDB();
      result = await dao.pessoaDao.insertPerson(pessoa) > 0 ? true : false;
    } catch (e) {
      result = false;
    }
    return result;
  }

  Future<bool> deleteDataPessoa(Pessoa pessoa) async {
    var result;
    try {
      dao = await _iniDB();
      result = await dao.pessoaDao.deletePerson(pessoa) > 0 ? true : false;
    } catch (e) {
      result = false;
    }
    return result;
  }

  Future<List<Pessoa>> listaDataPessoa() async {
    List<Pessoa> result = List<Pessoa>();
    try {
      dao = await _iniDB();
      result = await dao.pessoaDao.findAllPessoa();
    } catch (e) {
      result = null;
    }
    return result;
  }
}
