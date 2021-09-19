import 'package:dartz/dartz.dart';

import '../core/failures.dart';

Either<ValueFailure<String>, String> validateUsername(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUsername(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}
