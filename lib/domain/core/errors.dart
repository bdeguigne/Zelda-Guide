import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:zelda_guide/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    return Error.safeToString(
        'UnexpectedValueError(valueFailure: $valueFailure)');
  }
}

class UnexpectedAuthError extends Error {
  final AuthFailure authFailure;

  UnexpectedAuthError(this.authFailure);

  @override
  String toString() {
    return Error.safeToString('UnexpectedAuthError(authFailure: $authFailure)');
  }
}
