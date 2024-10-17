import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/datasources/local/movie_local_datasource.dart';
import 'package:movies/domain/entities/movie.dart';

import '../../core/failure.dart';
import '../../domain/repository/movie_local_repository.dart';

@LazySingleton(as: MovieLocalRepository)
class MovieLocalRepositoryImpl implements MovieLocalRepository {
  final MovieLocalDatasource _localDataSource;

  MovieLocalRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, Option<Movie>>> getMovieById(int id) async {
    final result = await _localDataSource.getMovieById(id);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (movies) {
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failure, int>> insertMovie(Movie movie) async {
    final result = await _localDataSource.insertMovie(movie);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (movie) {
        return Right(movie);
      },
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async {
    final result = await _localDataSource.getAllMovies();
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (movies) {
        return Right(movies);
      },
    );
  }

  @override
  Future<Either<Failure, int>> deleteMovie(int id) async {
    final result = await _localDataSource.deleteMovie(id);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (result) {
        return Right(result);
      },
    );
  }
}
