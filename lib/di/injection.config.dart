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

import '../data/datasources/local/database.dart' as _i3;
import '../data/datasources/local/movie_local_datasource.dart' as _i8;
import '../data/datasources/local/movie_local_datasource_impl.dart' as _i9;
import '../data/datasources/remote/movie_datasource.dart' as _i6;
import '../data/datasources/remote/movie_datasoure_impl.dart' as _i7;
import '../data/repositories/movie_local_repository_impl.dart' as _i11;
import '../data/repositories/movie_repository_impl.dart' as _i13;
import '../domain/repository/movie_local_repository.dart' as _i10;
import '../domain/repository/movie_repository.dart' as _i12;
import '../domain/usecase/remove_local_movie.dart' as _i14;
import '../domain/usecase/retrieve_all_local_movies.dart' as _i15;
import '../domain/usecase/retrieve_discovery_movies.dart' as _i16;
import '../domain/usecase/retrieve_genres.dart' as _i17;
import '../domain/usecase/retrieve_local_movie.dart' as _i18;
import '../domain/usecase/store_movie_to_local.dart' as _i19;
import '../presentation/home/store/detail_movie_store.dart' as _i20;
import '../presentation/home/store/home_store.dart' as _i21;
import '../presentation/router/app_router.dart' as _i4;
import 'network_module.dart' as _i22;
import 'register_module.dart' as _i23;

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
    final registerModule = _$RegisterModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AppDatabase>(() => registerModule.db);
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i6.MovieDatasource>(
        () => _i7.MovieDatasourceImpl(gh<_i5.Dio>()));
    gh.lazySingleton<_i8.MovieLocalDatasource>(
        () => _i9.MovieLocalDataSourceImpl(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i10.MovieLocalRepository>(() =>
        _i11.MovieLocalRepositoryImpl(
            localDataSource: gh<_i8.MovieLocalDatasource>()));
    gh.lazySingleton<_i12.MovieRepository>(
        () => _i13.MovieRepositoriesImpl(gh<_i6.MovieDatasource>()));
    gh.lazySingleton<_i14.RemoveLocalMovie>(
        () => _i14.RemoveLocalMovie(gh<_i10.MovieLocalRepository>()));
    gh.lazySingleton<_i15.RetrieveAllLocalMovies>(
        () => _i15.RetrieveAllLocalMovies(gh<_i10.MovieLocalRepository>()));
    gh.lazySingleton<_i16.RetrieveDiscoveryMovies>(
        () => _i16.RetrieveDiscoveryMovies(gh<_i12.MovieRepository>()));
    gh.lazySingleton<_i17.RetrieveGenres>(
        () => _i17.RetrieveGenres(gh<_i12.MovieRepository>()));
    gh.lazySingleton<_i18.RetrieveLocalMovie>(
        () => _i18.RetrieveLocalMovie(gh<_i10.MovieLocalRepository>()));
    gh.lazySingleton<_i19.StoreMovieToLocal>(
        () => _i19.StoreMovieToLocal(gh<_i10.MovieLocalRepository>()));
    gh.factory<_i20.DetailMovieStore>(() => _i20.DetailMovieStore(
          gh<_i19.StoreMovieToLocal>(),
          gh<_i14.RemoveLocalMovie>(),
          gh<_i18.RetrieveLocalMovie>(),
        ));
    gh.factory<_i21.HomeStore>(() => _i21.HomeStore(
          gh<_i17.RetrieveGenres>(),
          gh<_i16.RetrieveDiscoveryMovies>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i22.NetworkModule {}

class _$RegisterModule extends _i23.RegisterModule {}
