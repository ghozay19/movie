import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/datasources/local/movie_local_datasource.dart';
import 'package:movies/domain/entities/movie.dart';

import '../../core/failure.dart';
import '../../domain/repository/movie_local_repository.dart';

@LazySingleton(as: MovieLocalRepository)
class MovieLocalRepositoryImpl implements MovieLocalRepository {
  final MovieLocalDatasource localDataSource;

  MovieLocalRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Option<Movie>>> getMovieById(int id) async {
    return await localDataSource.getMovieById(id);
  }

  @override
  Future<Either<Failure, int>> insertMovie(Movie movie) async {
    return await localDataSource.insertMovie(movie);
  }

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async {
    return await localDataSource.getAllMovies();
  }

  @override
  Future<Either<Failure, int>> deleteMovie(int id) async {
    return await localDataSource.deleteMovie(id);
  }
}
