import 'package:movies/domain/entities/movie.dart';

class MoviesResponse {
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  MoviesResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
}
