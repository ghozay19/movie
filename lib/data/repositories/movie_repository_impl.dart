import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/mapper/genre_mapper.dart';
import 'package:movies/domain/entities/genre.dart';

import '../../core/constant/movies_sort_enum.dart';
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
  Future<Either<Failure, List<Genre>>> getGenres() async {
    final result = await remoteDatasource.getGenres();
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (moviesResponse) {
        final mappedGenres = moviesResponse.map(GenreMapper.toEntity).toList();
        return Right(mappedGenres);
      },
    );
  }

  @override
  Future<Either<Failure, MoviesResponse>> getDiscoverMovies(
      {required int page, int? genreId, MoviesSortBy? sortBy}) async {
    final result = await remoteDatasource.getDiscoverMovies(
      page: page,
      genreId: genreId,
      sortBy: sortBy,
    );
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
