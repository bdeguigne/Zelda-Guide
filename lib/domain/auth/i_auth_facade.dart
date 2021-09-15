import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  // Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> register({
    required EmailAddress emailAddress,
    required Password password,
  });

  //  Future<void> signOut();
}
