import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/movie_local_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import '../entities/movie.dart';

@LazySingleton()
class RetrieveLocalMovie implements UseCase<Option<Movie>, int> {
  final MovieLocalRepository movieLocalRepository;

  RetrieveLocalMovie(this.movieLocalRepository);

  @override
  Future<Either<Failure, Option<Movie>>> call(int params) async {
    return await movieLocalRepository.getMovieById(params);
  }
}
