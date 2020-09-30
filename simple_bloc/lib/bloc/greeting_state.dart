part of 'greeting_bloc.dart';
@immutable
abstract class GreetingState {}

class InitialGreetingState extends GreetingState {}

class HowdyState extends GreetingState {
  final String greeting;
  HowdyState(this.greeting);

}

class WhatUpState extends GreetingState {
  final String greeting;
  WhatUpState(this.greeting);
}


class YouAreRockState extends GreetingState {
  final String greeting;
  YouAreRockState(this.greeting);
}

class ErrorState extends GreetingState {}
