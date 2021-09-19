import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/core/failures.dart';
import 'package:zelda_guide/domain/core/value_objects.dart';
import 'package:zelda_guide/domain/auth/value_validators.dart';

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
