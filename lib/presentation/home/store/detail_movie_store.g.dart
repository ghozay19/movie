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

  late final _$_DetailMovieStoreActionController =
      ActionController(name: '_DetailMovieStore', context: context);

  @override
  void setMovieId(Movie movie) {
    final _$actionInfo = _$_DetailMovieStoreActionController.startAction(
        name: '_DetailMovieStore.setMovieId');
    try {
      return super.setMovieId(movie);
    } finally {
      _$_DetailMovieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
detailMovie: ${detailMovie}
    ''';
  }
}
