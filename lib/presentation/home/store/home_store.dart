import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/repository/movie_repository.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final MovieRepository movieRepository;

  _HomeStore(this.movieRepository);

  @observable
  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  ObservableFuture<List<Movie>>? moviesFuture;

  @observable
  String? errorMessage;

  int currentPage = 1;

  @action
  Future<void> fetchNowPlayingMovies() async {
    final result = await movieRepository.getNowPlayingMovies(currentPage);
    result.fold(
      (exception) {
        debugPrint('Error occurred: $exception');
      },
      (moviesResponse) {
        moviesFuture = ObservableFuture.value(moviesResponse.results!);
      },
    );
  }
}
