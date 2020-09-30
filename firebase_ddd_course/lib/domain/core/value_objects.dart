import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/auth/value_objects.dart';
import 'package:firebase_ddd_course/domain/core/errors.dart';
import 'package:firebase_ddd_course/domain/core/failures.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  //throws [UnexpectedValueError] containing the [ValueFailure]
  //id = identity - same as writing (right) => right
  T getOrCrash() => value.fold((f) => throw UnexpectedValueError(f), id);

  bool isValid() =>value.isRight();

//<editor-fold desc="Data Methods" defaultstate="collapsed">
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ValueObject<T> &&
              runtimeType == other.runtimeType &&
              value == other.value);

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'EmailAddress{' + ' value: $value,' + '}';
  }

//</editor-fold>
}