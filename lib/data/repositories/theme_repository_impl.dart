import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/theme_repository.dart';

import '../datasources/local/theme_datasource.dart';

@LazySingleton(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeDatasource _themeDatasource;

  ThemeRepositoryImpl(this._themeDatasource);

  @override
  Future<Either<Failure, bool>> getThemePreference() async {
    final result = await _themeDatasource.getThemePreference();
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (isDarkMode) {
        return Right(isDarkMode);
      },
    );
  }

  @override
  Future<Either<Failure, void>> saveThemePreference(bool isDarkMode) async {
    final result = await _themeDatasource.saveThemePreference(isDarkMode);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (isDarkMode) {
        return Right(isDarkMode);
      },
    );
  }
}
