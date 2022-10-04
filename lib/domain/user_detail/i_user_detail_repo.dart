import 'package:dartz/dartz.dart';
import 'package:foodiee_app/domain/user_detail/logged_in_user.dart';

abstract class IUserDetailRepo {
  Future<Option<LoggedInUser>> getUserDetail();
}
