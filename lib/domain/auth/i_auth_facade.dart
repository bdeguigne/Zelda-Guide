import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/auth/register_failure.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<Unit>> getSignedInUser();

  Future<Either<RegisterFailure, User>> register({
    required Username username,
    required EmailAddress emailAddress,
    required Password password,
  });

  //  Future<void> signOut();
}
