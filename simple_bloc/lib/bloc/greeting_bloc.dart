import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {

  static const List<String> greetingList = ['Howdy', 'What\'s up', 'You\'re Rock'];
  GreetingBloc() : super(InitialGreetingState());


  @override
  Stream<GreetingState> mapEventToState(
    GreetingEvent event,
  ) async* {
    if(event is HowdyEvent) {
      yield InitialGreetingState();
      final message = await getData(0);
      yield HowdyState(message);
    }
    if(event is WhatUpEvent) {
      yield InitialGreetingState();
      final message = await getData(1);
      yield WhatUpState(message);
    }
    if(event is YouAreRockEvent) {
      yield InitialGreetingState();
      try{
        final String greet = await getError(1);
        yield YouAreRockState(greet);
      }on Exception{
        yield ErrorState();
      }
  }
  }

  Future<String> getData(int index) async {
    await Future.delayed(Duration(seconds: 1));
    return greetingList[index];
  }
  Future<String> getError(int index) async {
    throw Exception('Error');
  }
}

