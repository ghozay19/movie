// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecase/retrieve_all_local_movies.dart';

import '../../../domain/usecase/usecase.dart';

part 'bookmark_store.g.dart';

@injectable
class BookmarkStore = _BookmarkStore with _$BookmarkStore;

abstract class _BookmarkStore with Store {
  final RetrieveAllLocalMovies retrieveAllLocalMovies;

  _BookmarkStore(this.retrieveAllLocalMovies);

  // Observable list to hold genres
  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  ObservableFuture<List<Movie>>? moviesFuture;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchBookmarks() async {
    if (moviesFuture?.status == FutureStatus.pending) {
      return;
    }

    final result = await retrieveAllLocalMovies.call(NoParams());
    result.fold((exception) {
      debugPrint('Error occurred: $exception');
      errorMessage = exception.toString();
    }, (response) {
      movies.clear();
      movies.addAll(response);
      moviesFuture = ObservableFuture.value(movies);
    });
  }
}
