import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_options.freezed.dart';

@freezed
class NavigationOption with _$NavigationOption {
  const factory NavigationOption.noUser() = NoUser;
  const factory NavigationOption.noAddress() = NoAddress;
  const factory NavigationOption.selectAddress() = SelectAddress;
}
