import 'package:drift/drift.dart';
import '../../../../domain/entities/movie.dart';
import '../database.dart';
import '../tables/movies_table.dart';

part 'movie_dao.g.dart';

@DriftAccessor(tables: [MoviesTable])
class MovieDao extends DatabaseAccessor<AppDatabase> with _$MovieDaoMixin {
  final AppDatabase db;
  MovieDao(this.db) : super(db);

  Future<int> insertMovie(Movie movie) {
    final movieCompanion = MoviesTableCompanion(
      id: Value(movie.id ?? 0),
      title: Value(movie.title ?? ''),
      overview: Value(movie.overview),
      releaseDate: movie.releaseDate != null
          ? Value(movie.releaseDate!)
          : const Value(null),
    );

    return into(moviesTable).insert(movieCompanion);
  }

  Future<List<Movie>> getAllMovies() async {
    final movieRows = await select(moviesTable).get();

    return movieRows.map((row) {
      return Movie(
        id: row.id,
        title: row.title,
        overview: row.overview,
        releaseDate: row.releaseDate,
      );
    }).toList();
  }

  Future<int> deleteMovie(int id) =>
      (delete(moviesTable)..where((tbl) => tbl.id.equals(id))).go();

  Future<Movie?> getMovieById(int id) async {
    final movieRow = await (select(moviesTable)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();

    if (movieRow == null) {
      return null;
    }

    return Movie(
      id: movieRow.id,
      title: movieRow.title,
      overview: movieRow.overview,
      releaseDate: movieRow.releaseDate,
    );
  }
}
