// ignore_for_file: depend_on_referenced_packages

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:movies/data/datasources/local/dao/theme_preferences_dao.dart';
import 'package:movies/data/datasources/local/tables/theme_preferences_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'dao/movie_dao.dart';
import 'tables/movies_table.dart';

part 'database.g.dart';

// Database class
@DriftDatabase(tables: [
  MoviesTable,
  ThemePreferencesTable
], daos: [
  MovieDao,
  ThemePreferencesDao,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Set up database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    return NativeDatabase(file);
  });
}
