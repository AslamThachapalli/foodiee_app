import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/current_user.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/value_object.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress.getOrCrash(),
        password: password.getOrCrash(),
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use' ||
          e.code == 'invalid-email' ||
          e.code == 'operation-not-allowed' ||
          e.code == 'weak-password') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        print(e.code);
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      print(e);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress.getOrCrash(),
        password: password.getOrCrash(),
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email' || e.code == 'wrong-password') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        print(e.code);
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      print(e);
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<CurrentUser>> getSignedInUser() async {
    User? firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      return some(CurrentUser(id: UniqueId(firebaseUser.uid)));
    } else {
      return none();
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}
