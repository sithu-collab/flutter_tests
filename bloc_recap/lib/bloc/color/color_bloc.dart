import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial());

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    if(event is ChangeColorEvent) {
      yield ChangeColorState(event.color);
    }
  }
}
