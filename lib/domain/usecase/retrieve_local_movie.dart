import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/movie_local_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import '../entities/movie.dart';

@LazySingleton()
class RetrieveLocalMovie implements UseCase<Option<Movie>, int> {
  final MovieLocalRepository _movieLocalRepository;

  RetrieveLocalMovie(this._movieLocalRepository);

  @override
  Future<Either<Failure, Option<Movie>>> call(int params) async {
    return await _movieLocalRepository.getMovieById(params);
  }
}
