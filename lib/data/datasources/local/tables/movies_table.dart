import 'package:drift/drift.dart';

class MoviesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get overview => text().nullable()();
  DateTimeColumn get releaseDate => dateTime().nullable()();
}
