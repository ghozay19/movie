import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/usecase/usecase.dart';

import '../../core/constant/movies_sort_enum.dart';
import '../entities/movies_response.dart';
import '../repository/movie_repository.dart';

@LazySingleton()
class RetrieveDiscoveryMovies
    implements UseCase<MoviesResponse, DiscoveryMoviesParams> {
  final MovieRepository movieRepository;

  RetrieveDiscoveryMovies(this.movieRepository);

  @override
  Future<Either<Failure, MoviesResponse>> call(
      DiscoveryMoviesParams params) async {
    return await movieRepository.getDiscoverMovies(
      page: params.page,
      genreId: params.genreId,
      sortBy: params.sortBy,
    );
  }
}

class DiscoveryMoviesParams {
  final int page;
  final int? genreId;
  final MoviesSortBy? sortBy;
  DiscoveryMoviesParams({
    required this.page,
    this.genreId,
    this.sortBy,
  });
}
