import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/current_user.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/user_detail/logged_in_user.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/core/value_object.dart';
import '../core/logged_in_user_dtos.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firebaseFirestore;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn, this._firebaseFirestore);

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
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required PhoneNumber phoneNumber,
    required UserName userName,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress.getOrCrash(),
        password: password.getOrCrash(),
      );
      print('finished authentication');

      LoggedInUser loggedInUser = LoggedInUser(
        userName: userName,
        emailAddress: emailAddress,
        phoneNumber: phoneNumber,
      );
      print('after logged in user; $loggedInUser , ${loggedInUser.toString()}');

      Option<CurrentUser> userOption = await getSignedInUser();
      userOption.fold(
        () => null,
        (user) async => await _firebaseFirestore
            .collection('users')
            .doc(user.id.getOrCrash())
            .set(LoggedInUserDto.fromDomain(loggedInUser).toJson()),
      );
      print('after userOption');

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
      print('inside signIn method');
      final googleUser = await _googleSignIn.signIn();
      print('googleUser: $googleUser');
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      print('googleuser != null');

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );
      print('before userCredential');
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);
      print('authenticated');
      User? user = userCredential.user!;

      print('''username: ${user.displayName}
      email: ${user.email}
      phoneNumber: ${user.phoneNumber}''');

      LoggedInUser loggedInUser = LoggedInUser(
        userName: UserName(user.displayName),
        emailAddress: EmailAddress(user.email!),
        phoneNumber: PhoneNumber(user.phoneNumber == null ? null : int.parse(user.phoneNumber!)),
      );
      print('loggedInUser: $loggedInUser');

      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(LoggedInUserDto.fromDomain(loggedInUser).toJson());

      // Option<CurrentUser> userOption = await getSignedInUser();
      // userOption.fold(
      //   () => null,
      //   (user) async => await _firebaseFirestore
      //       .collection('users')
      //       .doc(user.id.getOrCrash())
      //       .set(LoggedInUserDto.fromDomain(loggedInUser).toJson()),
      // );

      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}
