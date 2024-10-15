import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/usecase/usecase.dart';

import '../entities/movies_response.dart';
import '../repository/movie_repository.dart';

class RetrieveNowPlaying implements UseCase<MoviesResponse, int> {
  final MovieRepository movieRepository;

  RetrieveNowPlaying(this.movieRepository);

  @override
  Future<Either<Failure, MoviesResponse>> call(int params) async {
    return await movieRepository.getNowPlayingMovies(params);
  }
}
