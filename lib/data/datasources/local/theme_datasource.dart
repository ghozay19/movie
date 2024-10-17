import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';

abstract class ThemeDatasource {
  Future<Either<Failure, bool>> getThemePreference();
  Future<Either<Failure, void>> saveThemePreference(bool isDarkMode);
}
