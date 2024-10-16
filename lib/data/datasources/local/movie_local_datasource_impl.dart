import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/datasources/local/dao/movie_dao.dart';
import 'package:movies/data/datasources/local/movie_local_datasource.dart';
import '../../../core/failure.dart';
import '../../../domain/entities/movie.dart';
import 'database.dart';

@LazySingleton(as: MovieLocalDatasource)
class MovieLocalDataSourceImpl implements MovieLocalDatasource {
  final MovieDao _movieDao;

  MovieLocalDataSourceImpl(AppDatabase database)
      : _movieDao = MovieDao(database);

  @override
  Future<Either<Failure, int>> insertMovie(Movie movie) async {
    try {
      final result = await _movieDao.insertMovie(movie);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies() async {
    try {
      final moviesData = await _movieDao.getAllMovies();
      final movies = moviesData
          .map((data) => Movie(
                id: data.id,
                title: data.title,
                overview: data.overview,
                releaseDate: data.releaseDate,
              ))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Option<Movie>>> getMovieById(int id) async {
    try {
      final movieData = await _movieDao.getMovieById(id);
      if (movieData == null) {
        return Right(None()); // Use Option type to signify no movie found
      }
      final movie = Movie(
        id: movieData.id,
        title: movieData.title,
        overview: movieData.overview,
        releaseDate: movieData.releaseDate,
      );
      return Right(Some(movie));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteMovie(int id) async {
    try {
      final result = await _movieDao.deleteMovie(id);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
