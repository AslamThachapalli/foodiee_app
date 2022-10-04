import 'package:flutter/cupertino.dart';
import 'package:foodiee_app/domain/user_detail/address.dart';
import 'package:foodiee_app/domain/user_detail/i_user_detail_repo.dart';
import 'package:foodiee_app/domain/user_detail/logged_in_user.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDetailProvider with ChangeNotifier {
  final IUserDetailRepo _userDetailRepo;
  UserDetailProvider(this._userDetailRepo);

  LoggedInUser _loggedInUser = LoggedInUser.empty();
  Address _address = Address.empty();

  LoggedInUser get loggedInUser => _loggedInUser;
  Address get address => _address;

  Future<void> userDetailRequested() async {
    print('inside provider');
    final userOption = await _userDetailRepo.getUserDetail();
    userOption.fold(
      () => null,
      (loggedInUser) {
        print('assigning loggedInUser from provider');
        _loggedInUser = loggedInUser;
        _address = loggedInUser.address!;
        notifyListeners();
      },
    );
  }
}
