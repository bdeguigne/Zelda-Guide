import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:zelda_guide/constants.dart';
import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/auth/i_auth_facade.dart';
import 'package:zelda_guide/domain/auth/register_failure.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';
import 'package:zelda_guide/domain/core/errors.dart';
import '../core/hive_helpers.dart';

@LazySingleton(as: IAuthFacade)
class HiveAuthFacade implements IAuthFacade {
  @override
  Future<Either<RegisterFailure, User>> register({
    required Username username,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    // TODO Rajouter le password confirm
    try {
      final User user = User(username, emailAddress, password);

      var box = await Hive.openBox(BoxStorage.boxName);
      await box.addIfUniqueUsername(user);

      return right(user);
    } on UnexpectedAuthError catch (e) {
      if (e.authFailure == const AuthFailure.emailAlreadyInUse()) {
        print("USERNAME ALREADY IN USE");
        return left(const RegisterFailure.emailAlreadyInUse());
      } else {
        print("SERVER ERRROR");
        return left(const RegisterFailure.serverError());
      }
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    final box = await Hive.openBox(BoxStorage.boxName);
    final authenticatedUser = box.get(BoxStorage.keys.authenticatedUser);

    // await box.clear();

    print("AUTHENTICATED USER $authenticatedUser");

    return authenticatedUser != null
        ? some(User.fromJson(authenticatedUser))
        : none();
  }
}
