// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/domain/usecase/retrieve_theme_prefs.dart';
import 'package:movies/domain/usecase/save_theme_prefs.dart';
import 'package:movies/domain/usecase/usecase.dart';

part 'theme_store.g.dart';

@injectable
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final SaveThemePrefs _saveThemePrefs;
  final RetrieveThemePrefs _retrieveThemePrefs;

  _ThemeStore(
    this._saveThemePrefs,
    this._retrieveThemePrefs,
  );

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @action
  Future<void> toggleTheme(bool isDarkMode) async {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    await _saveThemePrefs.call(isDarkMode);
    loadThemePreference();
  }

  @action
  Future<void> loadThemePreference() async {
    final result = await _retrieveThemePrefs.call(NoParams());
    result.fold(
      (error) {
        debugPrint('An error occurred: $error');
        themeMode = ThemeMode.light;
      },
      (isDarkMode) {
        themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      },
    );
  }

  ThemeData get currentTheme =>
      themeMode == ThemeMode.dark ? ThemeData.dark() : ThemeData.light();
}
