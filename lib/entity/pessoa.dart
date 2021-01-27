import 'package:floor/floor.dart';

@Entity(tableName: 'Pessoa')
class Pessoa {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String firstnome;
  final String secondname;

  Pessoa({
    this.id,
    this.firstnome,
    this.secondname,
  });
}
