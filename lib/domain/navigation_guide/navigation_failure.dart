import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_failure.freezed.dart';

@freezed
class NavigationFailure with _$NavigationFailure {
  const factory NavigationFailure.unexpected() = Unexpected;
  const factory NavigationFailure.unknown() = Unknown;
}
