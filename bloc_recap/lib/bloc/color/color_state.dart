part of 'color_bloc.dart';

@immutable
abstract class ColorState {}

class ColorInitial extends ColorState {}

class ChangeColorState extends ColorState {
  final Color color;
  ChangeColorState(this.color);
}