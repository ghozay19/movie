import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/data/model/genre_model.dart';

import '../../../core/constant/movies_sort_enum.dart';
import '../../model/movies_response_model.dart';

abstract class MovieDatasource {
  Future<Either<Failure, List<GenreModel>>> getGenres();
  Future<Either<Failure, MoviesResponseModel>> getDiscoverMovies({
    required int page,
    int? genreId,
    MoviesSortBy? sortBy,
  });
}
