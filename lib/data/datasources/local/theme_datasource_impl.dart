import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/data/datasources/local/dao/theme_preferences_dao.dart';
import 'package:movies/data/datasources/local/theme_datasource.dart';

@LazySingleton(as: ThemeDatasource)
class ThemeDatasourceImpl implements ThemeDatasource {
  final ThemePreferencesDao _db;

  ThemeDatasourceImpl(this._db);

  @override
  Future<Either<Failure, bool>> getThemePreference() async {
    try {
      final result = await _db.getSavedThemePreference();
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveThemePreference(bool isDarkMode) async {
    try {
      final result = await _db.saveThemePreference(isDarkMode);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
