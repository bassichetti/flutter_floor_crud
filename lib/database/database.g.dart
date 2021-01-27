// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorSystemDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SystemDatabaseBuilder databaseBuilder(String name) =>
      _$SystemDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$SystemDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$SystemDatabaseBuilder(null);
}

class _$SystemDatabaseBuilder {
  _$SystemDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$SystemDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$SystemDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<SystemDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$SystemDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$SystemDatabase extends SystemDatabase {
  _$SystemDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PessoaDao _pessoaDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Pessoa` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `firstnome` TEXT, `secondname` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PessoaDao get pessoaDao {
    return _pessoaDaoInstance ??= _$PessoaDao(database, changeListener);
  }
}

class _$PessoaDao extends PessoaDao {
  _$PessoaDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _pessoaInsertionAdapter = InsertionAdapter(
            database,
            'Pessoa',
            (Pessoa item) => <String, dynamic>{
                  'id': item.id,
                  'firstnome': item.firstnome,
                  'secondname': item.secondname
                },
            changeListener),
        _pessoaUpdateAdapter = UpdateAdapter(
            database,
            'Pessoa',
            ['id'],
            (Pessoa item) => <String, dynamic>{
                  'id': item.id,
                  'firstnome': item.firstnome,
                  'secondname': item.secondname
                },
            changeListener),
        _pessoaDeletionAdapter = DeletionAdapter(
            database,
            'Pessoa',
            ['id'],
            (Pessoa item) => <String, dynamic>{
                  'id': item.id,
                  'firstnome': item.firstnome,
                  'secondname': item.secondname
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pessoa> _pessoaInsertionAdapter;

  final UpdateAdapter<Pessoa> _pessoaUpdateAdapter;

  final DeletionAdapter<Pessoa> _pessoaDeletionAdapter;

  @override
  Future<Pessoa> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Pessoa WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Pessoa(
            id: row['id'] as int,
            firstnome: row['firstnome'] as String,
            secondname: row['secondname'] as String));
  }

  @override
  Future<List<Pessoa>> findAllPessoa() async {
    return _queryAdapter.queryList('SELECT * FROM Pessoa',
        mapper: (Map<String, dynamic> row) => Pessoa(
            id: row['id'] as int,
            firstnome: row['firstnome'] as String,
            secondname: row['secondname'] as String));
  }

  @override
  Stream<List<Pessoa>> findAllPessoaWithStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Pessoa',
        queryableName: 'Pessoa',
        isView: false,
        mapper: (Map<String, dynamic> row) => Pessoa(
            id: row['id'] as int,
            firstnome: row['firstnome'] as String,
            secondname: row['secondname'] as String));
  }

  @override
  Future<int> insertPerson(Pessoa pessoa) {
    return _pessoaInsertionAdapter.insertAndReturnId(
        pessoa, OnConflictStrategy.abort);
  }

  @override
  Future<int> updatePerson(Pessoa pessoa) {
    return _pessoaUpdateAdapter.updateAndReturnChangedRows(
        pessoa, OnConflictStrategy.abort);
  }

  @override
  Future<int> deletePerson(Pessoa pessoa) {
    return _pessoaDeletionAdapter.deleteAndReturnChangedRows(pessoa);
  }
}
