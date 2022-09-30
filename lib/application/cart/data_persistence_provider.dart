import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../domain/cart/i_data_persistence_repo.dart';
import '../../domain/core/value_object.dart';

@injectable
class DataPersistenceProvider with ChangeNotifier {
  final IDataPersistence _dataPersistence;
  DataPersistenceProvider(this._dataPersistence);

  Map<String, int> _productCount = {};
  Map<String, int> get productCount => _productCount;

  void productIncremented(String productId, int currentCount) {
    int count = currentCount + 1;
    _dataPersistence.productIncremented(UniqueId(productId), count);
    _productCount[productId] = _dataPersistence.productCount(UniqueId(productId));
    notifyListeners();
  }

  void productDecremented(String productId, int currentCount) {
    if (currentCount > 0) {
      int count = currentCount - 1;
      _dataPersistence.productDecremented(UniqueId(productId), count);
      _productCount[productId] = _dataPersistence.productCount(UniqueId(productId));
      notifyListeners();
    } else {
      notifyListeners();
      return;
    }
  }

  void removeCount(String productId) {
    _dataPersistence.eraseCount(UniqueId(productId));
    _productCount.remove(productId);
    notifyListeners();
  }
}
