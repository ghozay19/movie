import '../../domain/entities/movie.dart';
import '../../domain/entities/movies_response.dart';
import '../model/movie_model.dart';
import '../model/movies_response_model.dart';

class MovieMapper {
  static MoviesResponse toEntity(MoviesResponseModel model) {
    return MoviesResponse(
      page: model.page ?? 0,
      results: model.results != null
          ? model.results!.map((model) => toMovieEntity(model)).toList()
          : [],
      totalPages: model.totalPages ?? 0,
      totalResults: model.totalResults ?? 0,
    );
  }

  static Movie toMovieEntity(MovieModel model) {
    return Movie(
      adult: model.adult ?? false,
      backdropPath: model.backdropPath ?? '',
      genreIds:
          model.genreIds != null ? model.genreIds!.map((e) => e).toList() : [],
      id: model.id ?? 0,
      originalLanguage: model.originalLanguage ?? '',
      originalTitle: model.originalTitle ?? '',
      overview: model.overview ?? '',
      popularity: model.popularity ?? 0.0,
      posterPath: model.posterPath ?? '',
      releaseDate: model.releaseDate ?? DateTime.now(),
      title: model.title ?? '',
      video: model.video ?? false,
      voteAverage: model.voteAverage ?? 0.0,
      voteCount: model.voteCount ?? 0,
    );
  }
}
