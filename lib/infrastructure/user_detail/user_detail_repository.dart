import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodiee_app/domain/user_detail/i_user_detail_repo.dart';
import 'package:foodiee_app/domain/user_detail/logged_in_user.dart';
import 'package:foodiee_app/infrastructure/core/logged_in_user_dtos.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserDetailRepo)
class UserDetailRepository implements IUserDetailRepo {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  UserDetailRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Option<LoggedInUser>> getUserDetail() async {
    User? currentUser = _firebaseAuth.currentUser;
    print('got user');
    if (currentUser != null) {
      print('currentUser != null');
      final userDoc = await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
      print('got userDoc; $userDoc');
      final response = userDoc.data();
      print('response is $response');
      final userDetail = userDoc.data()!;
      LoggedInUser loggedInUser = LoggedInUserDto.fromJson(userDetail).toDomain();
      print('loggedInUser: $loggedInUser');
      return some(loggedInUser);
    } else {
      print('currentUser==null');
      return none();
    }
  }
}
