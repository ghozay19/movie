import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/datasources/local/database.dart';
import '../tables/theme_preferences_table.dart';

part 'theme_preferences_dao.g.dart';

@DriftAccessor(tables: [ThemePreferencesTable])
@injectable
class ThemePreferencesDao extends DatabaseAccessor<AppDatabase>
    with _$ThemePreferencesDaoMixin {
  final AppDatabase db;
  ThemePreferencesDao(this.db) : super(db);

  Future<void> saveThemePreference(bool isDarkMode) async {
    into(themePreferencesTable).insertOnConflictUpdate(
      ThemePreferencesTableCompanion(
        id: const Value(1),
        isDarkMode: Value(isDarkMode),
      ),
    );
  }

  Future<bool> getSavedThemePreference() async {
    final result = await select(themePreferencesTable).getSingleOrNull();
    return result?.isDarkMode ?? false;
  }
}
