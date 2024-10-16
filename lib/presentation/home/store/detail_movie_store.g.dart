// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailMovieStore on _DetailMovieStore, Store {
  late final _$detailMovieAtom =
      Atom(name: '_DetailMovieStore.detailMovie', context: context);

  @override
  Movie? get detailMovie {
    _$detailMovieAtom.reportRead();
    return super.detailMovie;
  }

  @override
  set detailMovie(Movie? value) {
    _$detailMovieAtom.reportWrite(value, super.detailMovie, () {
      super.detailMovie = value;
    });
  }

  late final _$isBookmarkedAtom =
      Atom(name: '_DetailMovieStore.isBookmarked', context: context);

  @override
  bool get isBookmarked {
    _$isBookmarkedAtom.reportRead();
    return super.isBookmarked;
  }

  @override
  set isBookmarked(bool value) {
    _$isBookmarkedAtom.reportWrite(value, super.isBookmarked, () {
      super.isBookmarked = value;
    });
  }

  late final _$setMovieIdAsyncAction =
      AsyncAction('_DetailMovieStore.setMovieId', context: context);

  @override
  Future<void> setMovieId(Movie movie) {
    return _$setMovieIdAsyncAction.run(() => super.setMovieId(movie));
  }

  late final _$toggleBookmarkAsyncAction =
      AsyncAction('_DetailMovieStore.toggleBookmark', context: context);

  @override
  Future<void> toggleBookmark() {
    return _$toggleBookmarkAsyncAction.run(() => super.toggleBookmark());
  }

  @override
  String toString() {
    return '''
detailMovie: ${detailMovie},
isBookmarked: ${isBookmarked}
    ''';
  }
}
