import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidUsername({required String failedValue}) =
      InvalidUsername<T>;
  const factory ValueFailure.invalidPassword({required String failedValue}) =
      InvalidPassword<T>;
}
