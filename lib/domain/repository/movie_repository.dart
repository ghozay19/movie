import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/genre.dart';

import '../../core/constant/movies_sort_enum.dart';
import '../../core/failure.dart';
import '../entities/movies_response.dart';

abstract class MovieRepository {
  Future<Either<Failure, MoviesResponse>> getDiscoverMovies({
    required int page,
    int? genreId,
    MoviesSortBy? sortBy,
  });
  Future<Either<Failure, List<Genre>>> getGenres();
  Future<Either<Failure, MoviesResponse>> searchMovies({
    required int page,
    required String query,
  });
}
