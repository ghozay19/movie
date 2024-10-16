import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/constant/api_endpoints.dart';
import 'package:movies/data/model/genre_model.dart';

import '../../../core/constant/movies_sort_enum.dart';
import '../../../core/failure.dart';
import '../../model/movies_response_model.dart';
import 'movie_datasource.dart';

@LazySingleton(as: MovieDatasource)
class MovieDatasourceImpl implements MovieDatasource {
  final Dio dio;

  MovieDatasourceImpl(this.dio);

  @override
  Future<Either<Failure, List<GenreModel>>> getGenres() async {
    try {
      final response = await dio.get(
        ApiEndpoints.genreMovies,
      );

      final List<dynamic> genresJson = response.data['genres'];
      final listGenre =
          genresJson.map((json) => GenreModel.fromJson(json)).toList();

      return Right(listGenre);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.unknown) {
        return Left(NetworkFailure('Network error: ${error.message}'));
      } else {
        return Left(ServerFailure(
            'Server error: ${error.response?.statusMessage ?? 'Unknown error'}'));
      }
    } catch (error) {
      return Left(ServerFailure('Unexpected error: $error'));
    }
  }

  @override
  Future<Either<Failure, MoviesResponseModel>> getDiscoverMovies({
    required int page,
    int? genreId,
    MoviesSortBy? sortBy,
  }) async {
    try {
      final response = await dio.get(
        ApiEndpoints.discoverMovies,
        queryParameters: {
          'page': page,
          'language': 'en-EN',
          'with_genres': genreId,
          'sort_by': sortBy?.value,
        },
      );

      return Right(
        MoviesResponseModel.fromJson(response.data),
      );
    } on DioException catch (error) {
      if (error.type == DioExceptionType.unknown) {
        return Left(
          NetworkFailure('Network error: ${error.message}'),
        );
      } else {
        return Left(
          ServerFailure(
              'Server error: ${error.response?.statusMessage ?? 'Unknown error'}'),
        );
      }
    } catch (error) {
      return Left(
        ServerFailure('Unexpected error: $error'),
      );
    }
  }
}
