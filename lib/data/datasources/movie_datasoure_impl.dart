import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/failure.dart';
import '../model/movies_response_model.dart';
import 'movie_datasource.dart';

@LazySingleton(as: MovieDatasource)
class MovieDatasourceImpl implements MovieDatasource {
  final Dio dio;

  MovieDatasourceImpl(this.dio);

  @override
  Future<Either<Failure, MoviesResponseModel>> getNowPlayingMovies(
      int page) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/now_playing',
        queryParameters: {'page': page, 'language': 'en-US'},
      );

      return Right(MoviesResponseModel.fromJson(response.data));
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
}
