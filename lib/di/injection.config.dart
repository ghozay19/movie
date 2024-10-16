// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/movie_datasource.dart' as _i6;
import '../data/datasources/movie_datasoure_impl.dart' as _i7;
import '../data/repositories/movie_repository_impl.dart' as _i9;
import '../domain/repository/movie_repository.dart' as _i8;
import '../domain/usecase/retrieve_discovery_movies.dart' as _i10;
import '../domain/usecase/retrieve_genres.dart' as _i11;
import '../presentation/home/store/detail_movie_store.dart' as _i4;
import '../presentation/home/store/home_store.dart' as _i12;
import '../presentation/router/app_router.dart' as _i3;
import 'network_module.dart' as _i13;

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
    gh.factory<_i4.DetailMovieStore>(() => _i4.DetailMovieStore());
    gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i6.MovieDatasource>(
        () => _i7.MovieDatasourceImpl(gh<_i5.Dio>()));
    gh.factory<_i8.MovieRepository>(
        () => _i9.MovieRepositoriesImpl(gh<_i6.MovieDatasource>()));
    gh.lazySingleton<_i10.RetrieveDiscoveryMovies>(
        () => _i10.RetrieveDiscoveryMovies(gh<_i8.MovieRepository>()));
    gh.lazySingleton<_i11.RetrieveGenres>(
        () => _i11.RetrieveGenres(gh<_i8.MovieRepository>()));
    gh.factory<_i12.HomeStore>(() => _i12.HomeStore(
          gh<_i11.RetrieveGenres>(),
          gh<_i10.RetrieveDiscoveryMovies>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i13.NetworkModule {}
