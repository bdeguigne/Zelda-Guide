import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/domain/core/errors.dart';

extension HiveX on Box {
  /// Saves the [value] with an auto-increment key only if the [value.username] is not inside the box,
  /// otherwise throw [UnexpectedAuthError]
  Future<void> addIfUniqueUsername(User value) async {
    toMap().forEach((key, jsonUser) {
      final user = User.fromJson(jsonUser);
      if (value.username == user.username) {
        throw UnexpectedAuthError(const AuthFailure.emailAlreadyInUse());
      }
    });
    await add(value.toJson());
    // Store the current user in a specific key for auto login
    await put(BoxStorage.keys.authenticatedUser, value.toJson());
  }
}
