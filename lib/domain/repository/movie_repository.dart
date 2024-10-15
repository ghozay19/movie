import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/movies_response.dart';

abstract class MovieRepository {
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies(int page);
}
