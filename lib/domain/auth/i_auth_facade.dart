import 'package:dartz/dartz.dart';

import './value_objects.dart';
import './auth_failure.dart';
import './current_user.dart';

abstract class IAuthFacade {
  Future<Option<CurrentUser>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required PhoneNumber phoneNumber,
    required UserName userName,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
