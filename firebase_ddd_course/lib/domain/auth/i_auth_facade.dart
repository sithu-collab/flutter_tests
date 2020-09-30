import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/auth/auth_failures.dart';
import 'package:firebase_ddd_course/domain/auth/value_objects.dart';
import 'package:flutter/cupertino.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

}

