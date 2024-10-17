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
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasources/local/dao/theme_preferences_dao.dart' as _i22;
import '../data/datasources/local/database.dart' as _i3;
import '../data/datasources/local/movie_local_datasource.dart' as _i9;
import '../data/datasources/local/movie_local_datasource_impl.dart' as _i10;
import '../data/datasources/local/theme_datasource.dart' as _i26;
import '../data/datasources/local/theme_datasource_impl.dart' as _i27;
import '../data/datasources/remote/movie_datasource.dart' as _i7;
import '../data/datasources/remote/movie_datasoure_impl.dart' as _i8;
import '../data/repositories/movie_local_repository_impl.dart' as _i12;
import '../data/repositories/movie_repository_impl.dart' as _i14;
import '../data/repositories/theme_repository_impl.dart' as _i29;
import '../domain/repository/movie_local_repository.dart' as _i11;
import '../domain/repository/movie_repository.dart' as _i13;
import '../domain/repository/theme_repository.dart' as _i28;
import '../domain/usecase/remove_local_movie.dart' as _i15;
import '../domain/usecase/retrieve_all_local_movies.dart' as _i16;
import '../domain/usecase/retrieve_discovery_movies.dart' as _i17;
import '../domain/usecase/retrieve_genres.dart' as _i18;
import '../domain/usecase/retrieve_local_movie.dart' as _i19;
import '../domain/usecase/retrieve_theme_prefs.dart' as _i30;
import '../domain/usecase/save_theme_prefs.dart' as _i31;
import '../domain/usecase/search_movie.dart' as _i20;
import '../domain/usecase/store_movie_to_local.dart' as _i21;
import '../presentation/bookmark/store/bookmark_store.dart' as _i23;
import '../presentation/dashboard/store/dashboard_store.dart' as _i5;
import '../presentation/detail/store/detail_movie_store.dart' as _i24;
import '../presentation/home/store/home_store.dart' as _i25;
import '../presentation/router/app_router.dart' as _i4;
import '../presentation/theme/theme_store.dart' as _i32;
import 'network_module.dart' as _i33;
import 'register_module.dart' as _i34;

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
    gh.factory<_i5.DashboardStore>(() => _i5.DashboardStore());
    gh.lazySingleton<_i6.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i7.MovieDatasource>(
        () => _i8.MovieDatasourceImpl(gh<_i6.Dio>()));
    gh.lazySingleton<_i9.MovieLocalDatasource>(
        () => _i10.MovieLocalDataSourceImpl(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i11.MovieLocalRepository>(
        () => _i12.MovieLocalRepositoryImpl(gh<_i9.MovieLocalDatasource>()));
    gh.lazySingleton<_i13.MovieRepository>(
        () => _i14.MovieRepositoriesImpl(gh<_i7.MovieDatasource>()));
    gh.lazySingleton<_i15.RemoveLocalMovie>(
        () => _i15.RemoveLocalMovie(gh<_i11.MovieLocalRepository>()));
    gh.lazySingleton<_i16.RetrieveAllLocalMovies>(
        () => _i16.RetrieveAllLocalMovies(gh<_i11.MovieLocalRepository>()));
    gh.lazySingleton<_i17.RetrieveDiscoveryMovies>(
        () => _i17.RetrieveDiscoveryMovies(gh<_i13.MovieRepository>()));
    gh.lazySingleton<_i18.RetrieveGenres>(
        () => _i18.RetrieveGenres(gh<_i13.MovieRepository>()));
    gh.lazySingleton<_i19.RetrieveLocalMovie>(
        () => _i19.RetrieveLocalMovie(gh<_i11.MovieLocalRepository>()));
    gh.lazySingleton<_i20.SearchMovie>(
        () => _i20.SearchMovie(gh<_i13.MovieRepository>()));
    gh.lazySingleton<_i21.StoreMovieToLocal>(
        () => _i21.StoreMovieToLocal(gh<_i11.MovieLocalRepository>()));
    gh.factory<_i22.ThemePreferencesDao>(
        () => _i22.ThemePreferencesDao(gh<_i3.AppDatabase>()));
    gh.factory<_i23.BookmarkStore>(
        () => _i23.BookmarkStore(gh<_i16.RetrieveAllLocalMovies>()));
    gh.factory<_i24.DetailMovieStore>(() => _i24.DetailMovieStore(
          gh<_i21.StoreMovieToLocal>(),
          gh<_i15.RemoveLocalMovie>(),
          gh<_i19.RetrieveLocalMovie>(),
        ));
    gh.factory<_i25.HomeStore>(() => _i25.HomeStore(
          gh<_i18.RetrieveGenres>(),
          gh<_i17.RetrieveDiscoveryMovies>(),
        ));
    gh.lazySingleton<_i26.ThemeDatasource>(
        () => _i27.ThemeDatasourceImpl(gh<_i22.ThemePreferencesDao>()));
    gh.lazySingleton<_i28.ThemeRepository>(
        () => _i29.ThemeRepositoryImpl(gh<_i26.ThemeDatasource>()));
    gh.lazySingleton<_i30.RetrieveThemePrefs>(
        () => _i30.RetrieveThemePrefs(gh<_i28.ThemeRepository>()));
    gh.lazySingleton<_i31.SaveThemePrefs>(
        () => _i31.SaveThemePrefs(gh<_i28.ThemeRepository>()));
    gh.factory<_i32.ThemeStore>(() => _i32.ThemeStore(
          gh<_i31.SaveThemePrefs>(),
          gh<_i30.RetrieveThemePrefs>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i33.NetworkModule {}

class _$RegisterModule extends _i34.RegisterModule {}
