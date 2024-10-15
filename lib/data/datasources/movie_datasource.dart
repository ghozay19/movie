import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';

import '../model/movies_response_model.dart';

abstract class MovieDatasource {
  Future<Either<Failure, MoviesResponseModel>> getNowPlayingMovies(int page);
}
