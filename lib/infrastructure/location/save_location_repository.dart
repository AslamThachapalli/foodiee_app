import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/location/i_save_location_repo.dart';
import '../../domain/core/firestore_failures.dart';
import '../../domain/user_detail/address.dart';
import '../core/logged_in_user_dtos.dart';

@LazySingleton(as: ISaveLocationRepo)
class SaveLocationRepository implements ISaveLocationRepo {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  SaveLocationRepository(this._firebaseFirestore, this._firebaseAuth);

  @override
  Future<Option<Either<FirestoreFailure, Unit>>> saveAddressToServer({
    required String key,
    required Address address,
  }) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await _firebaseFirestore.collection('users').doc(user.uid).update({
          'address': AddressDto.fromDomain(address).toJson(),
        });

        return some(right(unit));
      } on FirebaseException catch (_) {
        return some(left(const FirestoreFailure.unexpected()));
      } catch (_) {
        return some(left(const FirestoreFailure.serverError()));
      }
    } else {
      return none();
    }
  }
}
