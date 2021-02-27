import 'package:flutter_floor_crud/entity/pessoa.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DataEvent {
  final Pessoa pessoa;

  DataEvent(this.pessoa);

  @override
  List<Object> get props => [pessoa];
}

class FetchData extends DataEvent {
  FetchData(Pessoa pessoa) : super(pessoa);

  @override
  List<Object> get props => [pessoa];
}
