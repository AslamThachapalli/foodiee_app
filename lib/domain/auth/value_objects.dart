import 'package:dartz/dartz.dart';
import 'package:foodiee_app/domain/core/failures.dart';

import '../core/value_object.dart';
import '../core/failures.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

class PhoneNumber extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory PhoneNumber(int input) {
    return PhoneNumber._(validatePhoneNumber(input));
  }

  const PhoneNumber._(this.value);
}

class UserName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UserName(String input) {
    return UserName._(validateUserName(input));
  }

  const UserName._(this.value);
}
