import 'package:drift/drift.dart';

class ThemePreferencesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  BoolColumn get isDarkMode => boolean().withDefault(const Constant(false))();
}
