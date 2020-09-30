import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'greet_event.dart';
part 'greet_state.dart';

class GreetBloc extends Bloc<GreetEvent, GreetState> {
  GreetBloc() : super(GreetInitial());

  @override
  Stream<GreetState> mapEventToState(
    GreetEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
