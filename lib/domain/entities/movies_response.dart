import 'package:movies/domain/entities/movie.dart';

class MoviesResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}
