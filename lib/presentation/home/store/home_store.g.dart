// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$errorMessageAtom =
      Atom(name: '_HomeStore.errorMessage', context: context);

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

  late final _$genresAtom = Atom(name: '_HomeStore.genres', context: context);

  @override
  ObservableList<Genre> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<Genre> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  late final _$genresFutureAtom =
      Atom(name: '_HomeStore.genresFuture', context: context);

  @override
  ObservableFuture<List<Genre>>? get genresFuture {
    _$genresFutureAtom.reportRead();
    return super.genresFuture;
  }

  @override
  set genresFuture(ObservableFuture<List<Genre>>? value) {
    _$genresFutureAtom.reportWrite(value, super.genresFuture, () {
      super.genresFuture = value;
    });
  }

  late final _$selectedGenreAtom =
      Atom(name: '_HomeStore.selectedGenre', context: context);

  @override
  Genre? get selectedGenre {
    _$selectedGenreAtom.reportRead();
    return super.selectedGenre;
  }

  @override
  set selectedGenre(Genre? value) {
    _$selectedGenreAtom.reportWrite(value, super.selectedGenre, () {
      super.selectedGenre = value;
    });
  }

  late final _$sortByAtom = Atom(name: '_HomeStore.sortBy', context: context);

  @override
  MoviesSortBy? get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(MoviesSortBy? value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  late final _$discoverMoviesAtom =
      Atom(name: '_HomeStore.discoverMovies', context: context);

  @override
  ObservableList<Movie> get discoverMovies {
    _$discoverMoviesAtom.reportRead();
    return super.discoverMovies;
  }

  @override
  set discoverMovies(ObservableList<Movie> value) {
    _$discoverMoviesAtom.reportWrite(value, super.discoverMovies, () {
      super.discoverMovies = value;
    });
  }

  late final _$discoverMoviesFutureAtom =
      Atom(name: '_HomeStore.discoverMoviesFuture', context: context);

  @override
  ObservableFuture<List<Movie>>? get discoverMoviesFuture {
    _$discoverMoviesFutureAtom.reportRead();
    return super.discoverMoviesFuture;
  }

  @override
  set discoverMoviesFuture(ObservableFuture<List<Movie>>? value) {
    _$discoverMoviesFutureAtom.reportWrite(value, super.discoverMoviesFuture,
        () {
      super.discoverMoviesFuture = value;
    });
  }

  late final _$fetchGenresAsyncAction =
      AsyncAction('_HomeStore.fetchGenres', context: context);

  @override
  Future<void> fetchGenres() {
    return _$fetchGenresAsyncAction.run(() => super.fetchGenres());
  }

  late final _$fetchDiscoveryMoviesAsyncAction =
      AsyncAction('_HomeStore.fetchDiscoveryMovies', context: context);

  @override
  Future<void> fetchDiscoveryMovies() {
    return _$fetchDiscoveryMoviesAsyncAction
        .run(() => super.fetchDiscoveryMovies());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setSelectedGenre(Genre? genre) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setSelectedGenre');
    try {
      return super.setSelectedGenre(genre);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortBy(MoviesSortBy? moviesSortBy) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setSortBy');
    try {
      return super.setSortBy(moviesSortBy);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
genres: ${genres},
genresFuture: ${genresFuture},
selectedGenre: ${selectedGenre},
sortBy: ${sortBy},
discoverMovies: ${discoverMovies},
discoverMoviesFuture: ${discoverMoviesFuture}
    ''';
  }
}
