import 'package:dartz/dartz.dart';

import '../../../core/failure.dart';
import '../../../domain/entities/movie.dart';

abstract class MovieLocalDatasource {
  Future<Either<Failure, int>> insertMovie(Movie movie);
  Future<Either<Failure, List<Movie>>> getAllMovies();
  Future<Either<Failure, Option<Movie>>> getMovieById(int id);
  Future<Either<Failure, int>> deleteMovie(int id);
}
