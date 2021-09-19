import 'package:dartz/dartz.dart';
import 'package:zelda_guide/domain/auth/auth_failure.dart';
import 'package:zelda_guide/domain/auth/user.dart';
import 'package:zelda_guide/domain/auth/value_objects.dart';

import 'auth_failure.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, User>> register({
    required Username username,
    required Password password,
    required Password confirmPassword,
  });

  //  Future<void> signOut();
}
