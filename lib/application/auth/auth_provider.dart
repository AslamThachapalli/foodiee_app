import 'package:flutter/foundation.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/value_objects.dart';
import '../../domain/auth/i_auth_facade.dart';

class AuthState {
  EmailAddress emailAddress;
  Password password;
  bool showErrorMessages;
  bool isSubmitting;
  Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;
  bool isAuthenticated;

  AuthState({
    required this.emailAddress,
    required this.password,
    required this.showErrorMessages,
    required this.isSubmitting,
    required this.authFailureOrSuccessOption,
    required this.isAuthenticated,
  });
}

@injectable
class AuthProvider with ChangeNotifier {
  final IAuthFacade _authFacade;

  AuthProvider(this._authFacade);

  AuthState _authState() {
    return AuthState(
      emailAddress: EmailAddress(''),
      password: Password(''),
      showErrorMessages: false,
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
      isAuthenticated: false,
    );
  }

  AuthState get authState {
    return _authState();
  }

  void emailChanged(String emailStr) {
    _authState().emailAddress = EmailAddress(emailStr);
    notifyListeners();
  }

  void passwordChanged(String passwordStr) {
    _authState().password = Password(passwordStr);
    notifyListeners();
  }

  Future<void> signInWithEmailAndPasswordPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = _authState().emailAddress.value.isRight();
    final isPasswordValid = _authState().password.value.isRight();

    if (isEmailValid && isPasswordValid) {
      _authState().isSubmitting = true;

      failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
        emailAddress: _authState().emailAddress,
        password: _authState().password,
      );
    }
    _authState().isSubmitting = false;
    _authState().showErrorMessages = true;
    _authState().authFailureOrSuccessOption = optionOf(failureOrSuccess);

    notifyListeners();
  }

  Future<void> registerWithEmailAndPasswordPressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    final isEmailValid = _authState().emailAddress.value.isRight();
    final isPasswordValid = _authState().password.value.isRight();

    if (isEmailValid && isPasswordValid) {
      _authState().isSubmitting = true;

      failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: _authState().emailAddress,
        password: _authState().password,
      );
    }
    _authState().isSubmitting = false;
    _authState().showErrorMessages = true;
    _authState().authFailureOrSuccessOption = optionOf(failureOrSuccess);

    notifyListeners();
  }

  Future<void> signInWithGooglePressed() async {
    Either<AuthFailure, Unit>? failureOrSuccess;
    _authState().isSubmitting = true;

    failureOrSuccess = await _authFacade.signInWithGoogle();

    _authState().isSubmitting = false;
    _authState().authFailureOrSuccessOption = optionOf(failureOrSuccess);

    notifyListeners();
  }

  Future<void> authCheckRequested() async {
    final userOption = await _authFacade.getSignedInUser();
    userOption.fold(
      () => _authState().isAuthenticated = false,
      (a) => _authState().isAuthenticated = true,
    );

    notifyListeners();
  }

  Future<void> signedOut() async {
    await _authFacade.signOut();
    _authState().isAuthenticated = false;

    notifyListeners();
  }
}
