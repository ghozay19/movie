import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/usecase/usecase.dart';

import '../entities/movies_response.dart';
import '../repository/movie_repository.dart';

@LazySingleton()
class SearchMovie implements UseCase<MoviesResponse, SearchMovieParams> {
  final MovieRepository _movieRepository;

  SearchMovie(this._movieRepository);

  @override
  Future<Either<Failure, MoviesResponse>> call(SearchMovieParams params) async {
    return await _movieRepository.searchMovies(
      page: params.page,
      query: params.query,
    );
  }
}

class SearchMovieParams {
  final int page;
  final String query;

  SearchMovieParams({
    required this.page,
    required this.query,
  });
}
