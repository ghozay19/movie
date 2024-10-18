// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import 'package:movies/core/constant/movies_sort_enum.dart';
import 'package:movies/domain/usecase/retrieve_genres.dart';
import 'package:movies/domain/usecase/search_movie.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:rxdart/rxdart.dart';

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
    this.searchMovie,
  ) {
    _searchQuery.stream
        .debounceTime(Duration(milliseconds: debounceDuration))
        .listen((query) async {
      if (query.isNotEmpty) {
        if (!hasReachmax) {
          final result = await searchMovie
              .call(SearchMovieParams(page: currentSearchPage, query: query));
          result.fold(
            (failure) {
              debugPrint('Error occurred: $failure');
              errorMessage = failure.toString();
            },
            (movies) {
              listSearchMovies.addAll(movies.results);

              searchMoviesFuture = ObservableFuture.value(listSearchMovies);

              currentSearchPage++;
            },
          );
        }
      }
    });
  }

  final SearchMovie searchMovie;
  final BehaviorSubject<String> _searchQuery = BehaviorSubject<String>();
  String get searchQuery => _searchQuery.value;

  @action
  void setSearchQuery(String query) {
    _searchQuery.add(query);
  }

  @observable
  String? errorMessage;

  @observable
  ObservableList<Genre> genres = ObservableList<Genre>();

  @observable
  ObservableFuture<List<Genre>>? genresFuture;

  @observable
  Genre? selectedGenre;

  @observable
  MoviesSortBy? sortBy;

  @observable
  ObservableList<Movie> discoverMovies = ObservableList<Movie>();

  @observable
  ObservableList<Movie> listSearchMovies = ObservableList<Movie>();

  @observable
  ObservableFuture<List<Movie>>? discoverMoviesFuture;

  @observable
  ObservableFuture<List<Movie>>? searchMoviesFuture;

  int currentDiscoveryPage = 1;
  int currentSearchPage = 1;
  final debounceDuration = 300;
  bool hasReachmax = false;

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

  @action
  Future<void> searchMovies() async {
    if (searchMoviesFuture?.status == FutureStatus.pending) {
      return;
    }

    if (!hasReachmax) {
      final result = await searchMovie.call(
        SearchMovieParams(page: currentSearchPage, query: _searchQuery.value),
      );
      result.fold(
        (failure) {
          debugPrint('Error occurred: $failure');
          errorMessage = failure.toString();
        },
        (movies) {
          if (currentSearchPage >= movies.totalPages) {
            hasReachmax = true;
            return;
          }

          final tempResult = listSearchMovies;

          for (final newMovie in movies.results) {
            if (!tempResult.any((movie) => movie.id == newMovie.id)) {
              tempResult.add(newMovie);
            }
          }

          searchMoviesFuture = ObservableFuture.value(tempResult);
          currentSearchPage++;
        },
      );
    }
  }
}
