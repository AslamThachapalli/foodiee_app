import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/user_detail/address.dart';
import '../../domain/user_detail/i_user_detail_repo.dart';
import '../../domain/user_detail/logged_in_user.dart';

@injectable
class UserDetailProvider with ChangeNotifier {
  final IUserDetailRepo _userDetailRepo;
  UserDetailProvider(this._userDetailRepo);

  LoggedInUser _loggedInUser = LoggedInUser.empty();
  Address _address = Address.empty();

  LoggedInUser get loggedInUser => _loggedInUser;
  Address get address => _address;

  Future<void> userDetailRequested() async {
    final userOption = await _userDetailRepo.getUserDetail();
    userOption.fold(
      () => null,
      (loggedInUser) {
        _loggedInUser = loggedInUser;
        _address = loggedInUser.address!;
        notifyListeners();
      },
    );
  }
}
