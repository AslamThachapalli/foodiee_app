import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

import '../../domain/navigation_guide/navigation_failure.dart';
import '../../domain/navigation_guide/i_navigation_guide_repo.dart';
import '../../domain/navigation_guide/navigation_options.dart';
import '../../domain/user_detail/address.dart';
import '../core/logged_in_user_dtos.dart';

@LazySingleton(as: INavigationGuideRepo)
class NavigationGuideRepository implements INavigationGuideRepo {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  NavigationGuideRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Either<NavigationFailure, NavigationOption>> getGuide() async {
    try {
      User? currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        return right(const NavigationOption.noUser());
      } else {
        final userDetail = await _firebaseFirestore.collection('users').doc(currentUser.uid).get();
        Map<String, String?> userAddressFromJson = userDetail.data()!['address'];
        Address address = AddressDto.fromJson(userAddressFromJson).toDomain();

        if (address.home == null && address.work == null && address.currentLocation == null) {
          return right(const NavigationOption.noAddress());
        } else {
          return right(const NavigationOption.selectAddress());
        }
      }
    } on FirebaseException catch (_) {
      return left(const NavigationFailure.unexpected());
    } catch (_) {
      return left(const NavigationFailure.unknown());
    }
  }
}
