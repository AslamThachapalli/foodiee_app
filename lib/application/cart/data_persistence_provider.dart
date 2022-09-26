import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cart/i_data_persistence_repo.dart';
import '../../domain/core/value_object.dart';

@injectable
class DataPersistenceProvider with ChangeNotifier {
  final IDataPersistence _dataPersistence;
  DataPersistenceProvider(this._dataPersistence);

  void productIncremented(String productId, int currentCount) {
    int count = currentCount + 1;
    _dataPersistence.productIncremented(UniqueId(productId), count);
    notifyListeners();
  }

  void productDecremented(String productId, int currentCount) {
    if (currentCount > 0) {
      int count = currentCount - 1;
      _dataPersistence.productDecremented(UniqueId(productId), count);
      notifyListeners();
    } else {
      notifyListeners();
      return;
    }
  }

  int getProductCount(String productId) {
    notifyListeners();
    return _dataPersistence.productCount(UniqueId(productId));
  }
}
