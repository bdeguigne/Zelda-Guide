// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  UsernameAlreadyInUse usernameAlreadyInUse() {
    return const UsernameAlreadyInUse();
  }

  PasswordNotMatch passwordNotMatch() {
    return const PasswordNotMatch();
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() usernameAlreadyInUse,
    required TResult Function() passwordNotMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(UsernameAlreadyInUse value) usernameAlreadyInUse,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(
          AuthFailure value, $Res Function(AuthFailure) then) =
      _$AuthFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthFailureCopyWithImpl<$Res> implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure _value;
  // ignore: unused_field
  final $Res Function(AuthFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$AuthFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() usernameAlreadyInUse,
    required TResult Function() passwordNotMatch,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(UsernameAlreadyInUse value) usernameAlreadyInUse,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements AuthFailure {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class $UsernameAlreadyInUseCopyWith<$Res> {
  factory $UsernameAlreadyInUseCopyWith(UsernameAlreadyInUse value,
          $Res Function(UsernameAlreadyInUse) then) =
      _$UsernameAlreadyInUseCopyWithImpl<$Res>;
}

/// @nodoc
class _$UsernameAlreadyInUseCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $UsernameAlreadyInUseCopyWith<$Res> {
  _$UsernameAlreadyInUseCopyWithImpl(
      UsernameAlreadyInUse _value, $Res Function(UsernameAlreadyInUse) _then)
      : super(_value, (v) => _then(v as UsernameAlreadyInUse));

  @override
  UsernameAlreadyInUse get _value => super._value as UsernameAlreadyInUse;
}

/// @nodoc

class _$UsernameAlreadyInUse implements UsernameAlreadyInUse {
  const _$UsernameAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure.usernameAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UsernameAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() usernameAlreadyInUse,
    required TResult Function() passwordNotMatch,
  }) {
    return usernameAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
  }) {
    return usernameAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (usernameAlreadyInUse != null) {
      return usernameAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(UsernameAlreadyInUse value) usernameAlreadyInUse,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
  }) {
    return usernameAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
  }) {
    return usernameAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (usernameAlreadyInUse != null) {
      return usernameAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class UsernameAlreadyInUse implements AuthFailure {
  const factory UsernameAlreadyInUse() = _$UsernameAlreadyInUse;
}

/// @nodoc
abstract class $PasswordNotMatchCopyWith<$Res> {
  factory $PasswordNotMatchCopyWith(
          PasswordNotMatch value, $Res Function(PasswordNotMatch) then) =
      _$PasswordNotMatchCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordNotMatchCopyWithImpl<$Res>
    extends _$AuthFailureCopyWithImpl<$Res>
    implements $PasswordNotMatchCopyWith<$Res> {
  _$PasswordNotMatchCopyWithImpl(
      PasswordNotMatch _value, $Res Function(PasswordNotMatch) _then)
      : super(_value, (v) => _then(v as PasswordNotMatch));

  @override
  PasswordNotMatch get _value => super._value as PasswordNotMatch;
}

/// @nodoc

class _$PasswordNotMatch implements PasswordNotMatch {
  const _$PasswordNotMatch();

  @override
  String toString() {
    return 'AuthFailure.passwordNotMatch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PasswordNotMatch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverError,
    required TResult Function() usernameAlreadyInUse,
    required TResult Function() passwordNotMatch,
  }) {
    return passwordNotMatch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
  }) {
    return passwordNotMatch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverError,
    TResult Function()? usernameAlreadyInUse,
    TResult Function()? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(UsernameAlreadyInUse value) usernameAlreadyInUse,
    required TResult Function(PasswordNotMatch value) passwordNotMatch,
  }) {
    return passwordNotMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
  }) {
    return passwordNotMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(UsernameAlreadyInUse value)? usernameAlreadyInUse,
    TResult Function(PasswordNotMatch value)? passwordNotMatch,
    required TResult orElse(),
  }) {
    if (passwordNotMatch != null) {
      return passwordNotMatch(this);
    }
    return orElse();
  }
}

abstract class PasswordNotMatch implements AuthFailure {
  const factory PasswordNotMatch() = _$PasswordNotMatch;
}
