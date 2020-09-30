part of 'color_bloc.dart';

@immutable
abstract class ColorEvent {}

class ChangeColorEvent extends ColorEvent {
  final Color color;
  ChangeColorEvent(this.color);
}