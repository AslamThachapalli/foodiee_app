import 'package:dartz/dartz.dart';

import './failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length > 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<int>, int> validatePhoneNumber(int? input) {
  if (input.toString().length == 10) {
    return right(input!);
  } else if (input != null) {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  } else {
    return left(const ValueFailure.invalidPhoneNumber(failedValue: 0));
  }
}

Either<ValueFailure<String?>, String?> validateUserName(String? input) {
  if (input == null) {
    return right(input);
  } else if (input.length > 3) {
    return right(input);
  } else {
    return left(ValueFailure.shortUserName(failedValue: input));
  }
}
