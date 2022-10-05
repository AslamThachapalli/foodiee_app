import 'package:dartz/dartz.dart';

import '../../domain/core/firestore_failures.dart';
import '../user_detail/address.dart';

abstract class ISaveLocationRepo {
  Future<Option<Either<FirestoreFailure, Unit>>> saveAddressToServer({
    required String key,
    required Address address,
  });
}
