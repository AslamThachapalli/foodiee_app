import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      InvalidEmail<T>;
  const factory ValueFailure.shortPassword({required T failedValue}) =
      ShortPassword<T>;
  const factory ValueFailure.invalidPhoneNumber({required T failedValue}) =
      InvalidPhoneNumber<T>;
  const factory ValueFailure.shortUserName({required T failedValue}) =
      ShortUserName<T>;
}
