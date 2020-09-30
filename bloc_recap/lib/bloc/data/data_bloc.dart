import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial());

  @override
  Stream<DataState> mapEventToState(
    DataEvent event,
  ) async* {
    if(event is GetDataEvent) {
      yield DataLoadingState();
      await Future.delayed(Duration(seconds: 2));
      yield GetDataState();
    }
  }
}
