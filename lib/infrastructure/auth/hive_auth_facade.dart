import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';
import 'package:zelda_guide/domain/core/errors.dart';
import '../core/hive_helpers.dart';

@LazySingleton(as: IAuthFacade)
class HiveAuthFacade implements IAuthFacade {
  @override
  Future<Either<AuthFailure, User>> register({
    required Username username,
    required Password password,
    required Password confirmPassword,
  }) async {
    try {
      if (password != confirmPassword) {
        return left(const AuthFailure.passwordNotMatch());
      }

      final User user = User(username, password);

      var box = await Hive.openBox(BoxStorage.boxName);
      await box.addIfUniqueUsername(user);

      return right(user);
    } on UnexpectedAuthError catch (e) {
      if (e.authFailure == const AuthFailure.usernameAlreadyInUse()) {
        return left(const AuthFailure.usernameAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    final box = await Hive.openBox(BoxStorage.boxName);
    final authenticatedUser = box.get(BoxStorage.keys.authenticatedUser);

    print("AUTHENTICATED USER $authenticatedUser");

    return authenticatedUser != null
        ? some(User.fromJson(authenticatedUser))
        : none();
  }
}
