import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/theme_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RetrieveThemePrefs implements UseCase<bool, NoParams> {
  final ThemeRepository _themeRepository;

  RetrieveThemePrefs(this._themeRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _themeRepository.getThemePreference();
  }
}
