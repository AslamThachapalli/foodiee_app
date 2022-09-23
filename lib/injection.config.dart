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

import 'application/auth/auth_provider.dart' as _i12;
import 'application/product_fetching/product_provider.dart' as _i11;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/product_fetching/i_product_repository.dart' as _i9;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/core/firebase_injectable_module.dart' as _i13;
import 'infrastructure/product_fetching/product_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.IAuthFacade>(() =>
      _i8.FirebaseAuthFacade(get<_i3.FirebaseAuth>(), get<_i6.GoogleSignIn>()));
  gh.lazySingleton<_i9.IProductRepository>(() => _i10.ProductRepository(
      get<_i4.FirebaseFirestore>(), get<_i5.FirebaseStorage>()));
  gh.factory<_i11.ProductProvider>(
      () => _i11.ProductProvider(get<_i9.IProductRepository>()));
  gh.factory<_i12.AuthProvider>(
      () => _i12.AuthProvider(get<_i7.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i13.FirebaseInjectableModule {}
