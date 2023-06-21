// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:ici_menu/app/di/di.dart' as _i11;
import 'package:ici_menu/app/pref/token_pref.dart' as _i4;
import 'package:ici_menu/data/network/app_api.dart' as _i7;
import 'package:ici_menu/data/network/dio_factory.dart' as _i5;
import 'package:ici_menu/data/repository/user_repository.dart' as _i9;
import 'package:ici_menu/data/source/remote/user_remote_data_source.dart'
    as _i8;
import 'package:ici_menu/presentation/user/user_view_model.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.TokenPref>(() => _i4.TokenPref());
    gh.lazySingleton<_i5.DioFactory>(() => _i5.DioFactory(gh<_i4.TokenPref>()));
    await gh.lazySingletonAsync<_i6.Dio>(
      () => registerModule.getDio,
      preResolve: true,
    );
    gh.lazySingleton<_i7.AppServiceClient>(
        () => _i7.AppServiceClient(gh<_i6.Dio>()));
    gh.lazySingleton<_i8.UserRemoteDataSource>(
        () => _i8.UserRemoteDataSourceImpl(gh<_i7.AppServiceClient>()));
    gh.lazySingleton<_i9.UserRepository>(
        () => _i9.UserRepositoryImpl(gh<_i8.UserRemoteDataSource>()));
    gh.lazySingleton<_i10.UserViewModel>(
        () => _i10.UserViewModel(gh<_i9.UserRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
