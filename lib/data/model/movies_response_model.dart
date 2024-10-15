import 'movie_model.dart';

class MoviesResponseModel {
  final int? page;
  final List<MovieModel>? results;
  final int? totalPages;
  final int? totalResults;

  MoviesResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json) =>
      MoviesResponseModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieModel>.from(
                json["results"]!.map((x) => MovieModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
