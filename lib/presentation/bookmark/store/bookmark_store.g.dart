// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookmarkStore on _BookmarkStore, Store {
  late final _$moviesAtom =
      Atom(name: '_BookmarkStore.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$moviesFutureAtom =
      Atom(name: '_BookmarkStore.moviesFuture', context: context);

  @override
  ObservableFuture<List<Movie>>? get moviesFuture {
    _$moviesFutureAtom.reportRead();
    return super.moviesFuture;
  }

  @override
  set moviesFuture(ObservableFuture<List<Movie>>? value) {
    _$moviesFutureAtom.reportWrite(value, super.moviesFuture, () {
      super.moviesFuture = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_BookmarkStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchBookmarksAsyncAction =
      AsyncAction('_BookmarkStore.fetchBookmarks', context: context);

  @override
  Future<void> fetchBookmarks() {
    return _$fetchBookmarksAsyncAction.run(() => super.fetchBookmarks());
  }

  @override
  String toString() {
    return '''
movies: ${movies},
moviesFuture: ${moviesFuture},
errorMessage: ${errorMessage}
    ''';
  }
}
