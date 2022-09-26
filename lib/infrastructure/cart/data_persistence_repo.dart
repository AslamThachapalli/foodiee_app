import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cart/i_data_persistence_repo.dart';
import '../../domain/core/value_object.dart';

@LazySingleton(as: IDataPersistence)
class DataPersistence implements IDataPersistence {
  final box = GetStorage();

  @override
  Option productIncremented(UniqueId productId, int count) {
    return some(box.write(productId.getOrCrash(), count));
  }

  @override
  Option productDecremented(UniqueId productId, int count) {
    if (count == 0) {
      return some(box.remove(productId.getOrCrash()));
    } else {
      return some(box.write(productId.getOrCrash(), count));
    }
  }

  @override
  int productCount(UniqueId productId) {
    return box.read(productId.getOrCrash()) ?? 0;
  }
}
