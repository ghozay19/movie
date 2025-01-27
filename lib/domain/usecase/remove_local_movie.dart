import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/movie_local_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RemoveLocalMovie implements UseCase<int, int> {
  final MovieLocalRepository _movieLocalRepository;

  RemoveLocalMovie(this._movieLocalRepository);

  @override
  Future<Either<Failure, int>> call(int params) async {
    return await _movieLocalRepository.deleteMovie(params);
  }
}
