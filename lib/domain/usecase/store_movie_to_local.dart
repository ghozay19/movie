import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/movie_local_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import '../entities/movie.dart';

@LazySingleton()
class StoreMovieToLocal implements UseCase<int, Movie> {
  final MovieLocalRepository movieLocalRepository;

  StoreMovieToLocal(this.movieLocalRepository);

  @override
  Future<Either<Failure, int>> call(Movie params) async {
    return await movieLocalRepository.insertMovie(params);
  }
}
