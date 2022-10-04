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

import 'application/auth/auth_provider.dart' as _i27;
import 'application/cart/cart_provider.dart' as _i28;
import 'application/cart/data_persistence_provider.dart' as _i29;
import 'application/location/location_provider.dart' as _i23;
import 'application/navigation_guide/navigation_guide_provider.dart' as _i24;
import 'application/product_fetching/product_provider.dart' as _i25;
import 'application/user_detail/user_detail_provider.dart' as _i26;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/cart/i_cart_repository.dart' as _i9;
import 'domain/cart/i_data_persistence_repo.dart' as _i11;
import 'domain/location/i_mapbox_repository.dart' as _i13;
import 'domain/location/i_save_location_repo.dart' as _i19;
import 'domain/navigation_guide/i_navigation_guide_repo.dart' as _i15;
import 'domain/product_fetching/i_product_repository.dart' as _i17;
import 'domain/user_detail/i_user_detail_repo.dart' as _i21;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/cart/cart_repository.dart' as _i10;
import 'infrastructure/cart/data_persistence_repo.dart' as _i12;
import 'infrastructure/core/firebase_injectable_module.dart' as _i30;
import 'infrastructure/location/mapbox_repository.dart' as _i14;
import 'infrastructure/location/save_location_repository.dart' as _i20;
import 'infrastructure/navigation_guide/navigation_guide_repository.dart'
    as _i16;
import 'infrastructure/product_fetching/product_repository.dart' as _i18;
import 'infrastructure/user_detail/user_detail_repository.dart'
    as _i22; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.ICartRepository>(() => _i10.CartRepository());
  gh.lazySingleton<_i11.IDataPersistence>(() => _i12.DataPersistence());
  gh.lazySingleton<_i13.IMapboxRepository>(() => _i14.MapboxRepository());
  gh.lazySingleton<_i15.INavigationGuideRepo>(() =>
      _i16.NavigationGuideRepository(
          get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i17.IProductRepository>(() => _i18.ProductRepository(
      get<_i4.FirebaseFirestore>(), get<_i5.FirebaseStorage>()));
  gh.lazySingleton<_i19.ISaveLocationRepo>(() => _i20.SaveLocationRepository());
  gh.lazySingleton<_i21.IUserDetailRepo>(() => _i22.UserDetailRepository(
      get<_i4.FirebaseFirestore>(), get<_i3.FirebaseAuth>()));
  gh.factory<_i23.LocationProvider>(() => _i23.LocationProvider(
      get<_i19.ISaveLocationRepo>(), get<_i13.IMapboxRepository>()));
  gh.factory<_i24.NavigationGuideProvider>(
      () => _i24.NavigationGuideProvider(get<_i15.INavigationGuideRepo>()));
  gh.factory<_i25.ProductProvider>(
      () => _i25.ProductProvider(get<_i17.IProductRepository>()));
  gh.factory<_i26.UserDetailProvider>(
      () => _i26.UserDetailProvider(get<_i21.IUserDetailRepo>()));
  gh.factory<_i27.AuthProvider>(
      () => _i27.AuthProvider(get<_i7.IAuthFacade>()));
  gh.factory<_i28.CartProvider>(
      () => _i28.CartProvider(get<_i9.ICartRepository>()));
  gh.factory<_i29.DataPersistenceProvider>(
      () => _i29.DataPersistenceProvider(get<_i11.IDataPersistence>()));
  return get;
}

class _$FirebaseInjectableModule extends _i30.FirebaseInjectableModule {}
