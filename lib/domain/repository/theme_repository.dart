import 'package:dartz/dartz.dart';

import '../../core/failure.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> getThemePreference();
  Future<Either<Failure, void>> saveThemePreference(bool isDarkMode);
}
