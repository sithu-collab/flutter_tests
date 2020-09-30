import 'package:firebase_ddd_course/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point.Terminating..';
    // TODO: implement toString
    return Error.safeToString('$explanation  Failure was : $valueFailure');
  }
}