// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  late final _$themeModeAtom =
      Atom(name: '_ThemeStore.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$toggleThemeAsyncAction =
      AsyncAction('_ThemeStore.toggleTheme', context: context);

  @override
  Future<void> toggleTheme(bool isDarkMode) {
    return _$toggleThemeAsyncAction.run(() => super.toggleTheme(isDarkMode));
  }

  late final _$loadThemePreferenceAsyncAction =
      AsyncAction('_ThemeStore.loadThemePreference', context: context);

  @override
  Future<void> loadThemePreference() {
    return _$loadThemePreferenceAsyncAction
        .run(() => super.loadThemePreference());
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode}
    ''';
  }
}
