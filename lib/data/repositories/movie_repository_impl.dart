import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../../domain/entities/movies_response.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movie_datasource.dart';
import '../mapper/movie_mapper.dart';

@Injectable(as: MovieRepository)
class MovieRepositoriesImpl implements MovieRepository {
  final MovieDatasource remoteDatasource;
  MovieRepositoriesImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, MoviesResponse>> getNowPlayingMovies(int page) async {
    final result = await remoteDatasource.getNowPlayingMovies(page);
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (moviesResponse) {
        final movies = MovieMapper.toEntity(moviesResponse);
        return Right(movies);
      },
    );
  }
}
