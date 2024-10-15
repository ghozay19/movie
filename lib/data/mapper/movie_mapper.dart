import '../../domain/entities/movie.dart';
import '../../domain/entities/movies_response.dart';
import '../model/movie_model.dart';
import '../model/movies_response_model.dart';

class MovieMapper {
  static MoviesResponse toEntity(MoviesResponseModel model) {
    return MoviesResponse(
      page: model.page,
      results: model.results?.map((model) => toMovieEntity(model)).toList(),
      totalPages: model.totalPages,
      totalResults: model.totalResults,
    );
  }

  static Movie toMovieEntity(MovieModel model) {
    return Movie(
      adult: model.adult,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds?.map((e) => e).toList(),
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }
}
