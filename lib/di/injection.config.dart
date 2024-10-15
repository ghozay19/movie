// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/movie_datasource.dart' as _i4;
import '../data/datasources/movie_datasoure_impl.dart' as _i5;
import '../data/repositories/movie_repository_impl.dart' as _i7;
import '../domain/repository/movie_repository.dart' as _i6;
import 'network_module.dart' as _i8;

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
    gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i4.MovieDatasource>(
        () => _i5.MovieDatasourceImpl(gh<_i3.Dio>()));
    gh.factory<_i6.MovieRepository>(
        () => _i7.MovieRepositoriesImpl(gh<_i4.MovieDatasource>()));
    return this;
  }
}

class _$NetworkModule extends _i8.NetworkModule {}
