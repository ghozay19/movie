import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:movies/core/constant/movies_sort_enum.dart';
import 'package:movies/domain/usecase/retrieve_genres.dart';
import 'package:movies/domain/usecase/usecase.dart';

import "../../../domain/entities/movie.dart";
import '../../../domain/entities/genre.dart';
import '../../../domain/usecase/retrieve_discovery_movies.dart';

part 'home_store.g.dart';

@injectable
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final RetrieveGenres retrieveGenres;
  final RetrieveDiscoveryMovies retrieveDiscoveryMovies;

  _HomeStore(
    this.retrieveGenres,
    this.retrieveDiscoveryMovies,
  );

  @observable
  String? errorMessage;

  // Observable list to hold genres
  @observable
  ObservableList<Genre> genres = ObservableList<Genre>();

  @observable
  ObservableFuture<List<Genre>>? genresFuture;

  @observable
  Genre? selectedGenre;

  @observable
  MoviesSortBy? sortBy;

  @action
  void setSelectedGenre(Genre? genre) {
    selectedGenre = genre;

    discoverMovies.clear();
    currentDiscoveryPage = 1;
    fetchDiscoveryMovies();
  }

  @action
  void setSortBy(MoviesSortBy? moviesSortBy) {
    if (sortBy == moviesSortBy) {
      sortBy = null;
      discoverMovies.clear();
      currentDiscoveryPage = 1;
      fetchDiscoveryMovies();
      return;
    }

    sortBy = moviesSortBy;

    discoverMovies.clear();
    currentDiscoveryPage = 1;
    fetchDiscoveryMovies();
  }

  @action
  Future<void> fetchGenres() async {
    if (genresFuture?.status == FutureStatus.pending) {
      return;
    }

    final result = await retrieveGenres.call(NoParams());
    result.fold((exception) {
      debugPrint('Error occurred: $exception');
      errorMessage = exception.toString();
    }, (response) {
      genres.clear();
      genres.addAll(response);
      genresFuture = ObservableFuture.value(genres);
      fetchDiscoveryMovies();
    });
  }

  @observable
  ObservableList<Movie> discoverMovies = ObservableList<Movie>();
  @observable
  ObservableFuture<List<Movie>>? discoverMoviesFuture;

  int currentDiscoveryPage = 1;
  @action
  Future<void> fetchDiscoveryMovies() async {
    if (discoverMoviesFuture?.status == FutureStatus.pending) {
      return;
    }

    final result = await retrieveDiscoveryMovies.call(
      DiscoveryMoviesParams(
        page: currentDiscoveryPage,
        genreId: selectedGenre?.id,
        sortBy: sortBy,
      ),
    );
    result.fold(
      (exception) {
        debugPrint('Error occurred: $exception');
        errorMessage = exception.toString();
      },
      (moviesResponse) {
        discoverMovies.addAll(moviesResponse.results);

        discoverMoviesFuture = ObservableFuture.value(discoverMovies);

        currentDiscoveryPage++;
      },
    );
  }
}
