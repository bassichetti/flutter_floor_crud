import 'package:bloc/bloc.dart';
import 'package:flutter_floor_crud/bloc/dataevent.dart';
import 'package:flutter_floor_crud/bloc/datastate.dart';
import 'package:flutter_floor_crud/service/pessoa_service.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(Initial());
  PessoaService pessoaService = PessoaService();
  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is FetchData) {
      yield Loading();
      bool result = await pessoaService.insertDataPessoa(event.pessoa);
      await Future.delayed(Duration(seconds: 3));
      yield Initial();
      //yield Success();
    }
  }
}
