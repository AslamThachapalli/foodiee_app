import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/user_detail/i_user_detail_repo.dart';
import '../../domain/user_detail/logged_in_user.dart';
import '../core/logged_in_user_dtos.dart';

@LazySingleton(as: IUserDetailRepo)
class UserDetailRepository implements IUserDetailRepo {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  UserDetailRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Option<LoggedInUser>> getUserDetail() async {
    User? currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      final userDoc = await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
      final userDetail = userDoc.data()!;
      LoggedInUser loggedInUser = LoggedInUserDto.fromJson(userDetail).toDomain();
      return some(loggedInUser);
    } else {
      return none();
    }
  }
}
