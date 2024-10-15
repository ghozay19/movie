// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/movie_datasource.dart' as _i5;
import '../data/datasources/movie_datasoure_impl.dart' as _i6;
import '../data/repositories/movie_repository_impl.dart' as _i8;
import '../domain/repository/movie_repository.dart' as _i7;
import '../presentation/home/store/home_store.dart' as _i9;
import '../presentation/router/app_router.dart' as _i3;
import 'network_module.dart' as _i10;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i5.MovieDatasource>(
        () => _i6.MovieDatasourceImpl(gh<_i4.Dio>()));
    gh.factory<_i7.MovieRepository>(
        () => _i8.MovieRepositoriesImpl(gh<_i5.MovieDatasource>()));
    gh.factory<_i9.HomeStore>(() => _i9.HomeStore(gh<_i7.MovieRepository>()));
    return this;
  }
}

class _$NetworkModule extends _i10.NetworkModule {}
