part of 'greeting_bloc.dart';

@immutable
abstract class GreetingEvent {}

class HowdyEvent extends GreetingEvent {}

class WhatUpEvent extends GreetingEvent {}

class YouAreRockEvent extends GreetingEvent {}


