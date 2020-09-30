import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/core/failures.dart';
import 'package:firebase_ddd_course/domain/core/value_objects.dart';
import 'package:firebase_ddd_course/domain/core/value_validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
class EmailAddress extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(value: validateEmailAddress(input));
  }

  const EmailAddress._({
    @required this.value,
  });
}

class Password extends ValueObject<String>{
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(value: validePassword(input));
  }

  const Password._({
    @required this.value,
  });
}


