import 'package:freezed_annotation/freezed_annotation.dart';

import '../auth/value_objects.dart';
import './address.dart';

part 'logged_in_user.freezed.dart';

@freezed
class LoggedInUser with _$LoggedInUser {
  const factory LoggedInUser({
    required UserName userName,
    required EmailAddress emailAddress,
    required PhoneNumber phoneNumber,
    Address? address,
  }) = _LoggedInUser;

  factory LoggedInUser.empty() => LoggedInUser(
        userName: UserName(''),
        emailAddress: EmailAddress(''),
        phoneNumber: PhoneNumber(0),
      );
}
