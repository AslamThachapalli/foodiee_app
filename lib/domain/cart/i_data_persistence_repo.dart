import 'package:dartz/dartz.dart';

import '../core/value_object.dart';

abstract class IDataPersistence {
  Option productIncremented(UniqueId productId, int count);
  Option productDecremented(UniqueId productId, int count);
  int productCount(UniqueId productId);
}
