import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/core/failures.dart';
import 'package:zelda_guide/domain/core/value_objects.dart';
import 'package:zelda_guide/domain/auth/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);

  factory EmailAddress.fromJson(String jsonValue) =>
      EmailAddress._(validateEmailAddress(jsonValue));
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  factory Password.fromJson(String jsonValue) =>
      Password._(validatePassword(jsonValue));
}

class Username extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);

  factory Username.fromJson(String jsonValue) =>
      Username._(validateUsername(jsonValue));
}
