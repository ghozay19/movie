import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/theme_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveThemePrefs implements UseCase<void, bool> {
  final ThemeRepository _themeRepository;

  SaveThemePrefs(this._themeRepository);

  @override
  Future<Either<Failure, void>> call(bool params) async {
    return await _themeRepository.saveThemePreference(params);
  }
}
