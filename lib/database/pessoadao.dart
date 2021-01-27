import 'package:floor/floor.dart';
import 'package:flutter_floor_crud/entity/pessoa.dart';

@dao
abstract class PessoaDao {
  @insert
  Future<int> insertPerson(Pessoa pessoa);

  @update
  Future<int> updatePerson(Pessoa pessoa);

  @delete
  Future<int> deletePerson(Pessoa pessoa);

  @Query('SELECT * FROM Pessoa WHERE id = :id')
  Future<Pessoa> findPersonById(int id);

  @Query('SELECT * FROM Pessoa')
  Future<List<Pessoa>> findAllPessoa();

  @Query('SELECT * FROM Pessoa')
  Stream<List<Pessoa>> findAllPessoaWithStream();
}
