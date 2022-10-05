import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_failures.freezed.dart';

@freezed
class FirestoreFailure with _$FirestoreFailure {
  const factory FirestoreFailure.unexpected() = Unexpected;
  const factory FirestoreFailure.serverError() = ServerError;
}
