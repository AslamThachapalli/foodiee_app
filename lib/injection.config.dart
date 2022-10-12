// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/auth_provider.dart' as _i32;
import 'application/cart/cart_provider.dart' as _i34;
import 'application/cart/data_persistence_provider.dart' as _i35;
import 'application/cart_history/cart_history_provider.dart' as _i33;
import 'application/location/location_provider.dart' as _i27;
import 'application/navigation_guide/navigation_guide_provider.dart' as _i28;
import 'application/order/order_provider.dart' as _i29;
import 'application/product_fetching/product_provider.dart' as _i30;
import 'application/user_detail/user_detail_provider.dart' as _i31;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/cart/i_cart_repository.dart' as _i11;
import 'domain/cart/i_data_persistence_repo.dart' as _i13;
import 'domain/cart_history/i_cart_history_repo.dart' as _i9;
import 'domain/location/i_mapbox_repository.dart' as _i15;
import 'domain/location/i_save_location_repo.dart' as _i23;
import 'domain/navigation_guide/i_navigation_guide_repo.dart' as _i17;
import 'domain/order/i_order_repository.dart' as _i19;
import 'domain/product_fetching/i_product_repository.dart' as _i21;
import 'domain/user_detail/i_user_detail_repo.dart' as _i25;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/cart/cart_repository.dart' as _i12;
import 'infrastructure/cart/data_persistence_repo.dart' as _i14;
import 'infrastructure/cart_history/cart_history_repository.dart' as _i10;
import 'infrastructure/core/firebase_injectable_module.dart' as _i36;
import 'infrastructure/location/mapbox_repository.dart' as _i16;
import 'infrastructure/location/save_location_repository.dart' as _i24;
import 'infrastructure/navigation_guide/navigation_guide_repository.dart'
    as _i18;
import 'infrastructure/order/order_repository.dart' as _i20;
import 'infrastructure/product_fetching/product_repository.dart' as _i22;
import 'infrastructure/user_detail/user_detail_repository.dart'
    as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFirestore);
  gh.lazySingleton<_i5.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseStorage);
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(() => _i8.FirebaseAuthFacade(
      get<_i3.FirebaseAuth>(),
      get<_i6.GoogleSignIn>(),
      get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i9.ICartHistoryRepo>(() => _i10.CartHistoryRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i11.ICartRepository>(() => _i12.CartRepository());
  gh.lazySingleton<_i13.IDataPersistence>(() => _i14.DataPersistence());
  gh.lazySingleton<_i15.IMapboxRepository>(() => _i16.MapboxRepository());
  gh.lazySingleton<_i17.INavigationGuideRepo>(() =>
      _i18.NavigationGuideRepository(
          get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i19.IOrderRepository>(() => _i20.OrderRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i21.IProductRepository>(() => _i22.ProductRepository(
      get<_i4.FirebaseFirestore>(), get<_i5.FirebaseStorage>()));
  gh.lazySingleton<_i23.ISaveLocationRepo>(() => _i24.SaveLocationRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i25.IUserDetailRepo>(() => _i26.UserDetailRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.factory<_i27.LocationProvider>(() => _i27.LocationProvider(
      get<_i23.ISaveLocationRepo>(), get<_i15.IMapboxRepository>()));
  gh.factory<_i28.NavigationGuideProvider>(
      () => _i28.NavigationGuideProvider(get<_i17.INavigationGuideRepo>()));
  gh.factory<_i29.OrderProvider>(
      () => _i29.OrderProvider(get<_i19.IOrderRepository>()));
  gh.factory<_i30.ProductProvider>(
      () => _i30.ProductProvider(get<_i21.IProductRepository>()));
  gh.factory<_i31.UserDetailProvider>(
      () => _i31.UserDetailProvider(get<_i25.IUserDetailRepo>()));
  gh.factory<_i32.AuthProvider>(
      () => _i32.AuthProvider(get<_i7.IAuthFacade>()));
  gh.factory<_i33.CartHistoryProvider>(
      () => _i33.CartHistoryProvider(get<_i9.ICartHistoryRepo>()));
  gh.factory<_i34.CartProvider>(
      () => _i34.CartProvider(get<_i11.ICartRepository>()));
  gh.factory<_i35.DataPersistenceProvider>(
      () => _i35.DataPersistenceProvider(get<_i13.IDataPersistence>()));
  return get;
}

class _$FirebaseInjectableModule extends _i36.FirebaseInjectableModule {}
