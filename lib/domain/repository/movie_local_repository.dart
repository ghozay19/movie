import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie.dart';

import '../../core/failure.dart';

abstract class MovieLocalRepository {
  Future<Either<Failure, Option<Movie>>> getMovieById(int id);
  Future<Either<Failure, int>> insertMovie(Movie movie);
  Future<Either<Failure, List<Movie>>> getAllMovies();
  Future<Either<Failure, int>> deleteMovie(int id);
}
