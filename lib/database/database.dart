import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_floor_crud/database/pessoadao.dart';
import 'package:flutter_floor_crud/entity/pessoa.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Pessoa])
abstract class SystemDatabase extends FloorDatabase {
  PessoaDao get pessoaDao;
}
