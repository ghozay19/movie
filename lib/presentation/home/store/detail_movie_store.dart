import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/domain/usecase/retrieve_local_movie.dart';
import 'package:movies/domain/usecase/store_movie_to_local.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecase/remove_local_movie.dart';

part 'detail_movie_store.g.dart';

@injectable
class DetailMovieStore = _DetailMovieStore with _$DetailMovieStore;

abstract class _DetailMovieStore with Store {
  final StoreMovieToLocal _storeMovieToLocal;
  final RemoveLocalMovie _removeLocalMovie;
  final RetrieveLocalMovie _retrieveLocalMovie;

  _DetailMovieStore(
    this._storeMovieToLocal,
    this._removeLocalMovie,
    this._retrieveLocalMovie,
  );
  @observable
  Movie? detailMovie;

  @action
  Future<void> setMovieId(Movie movie) async {
    detailMovie = movie;
    final isMovieExist = await _retrieveLocalMovie.call(movie.id!);
    // isMovieExist.fold(
    //   (exception) => debugPrint('Error occurred: $exception'),
    //   (result) => isBookmarked = true,
    // );
    isMovieExist.fold(
      (failure) {
        isBookmarked = false;
      },
      (option) => option.fold(
        () {
          // Handle the case where no movie was found
          isBookmarked = false;
        },
        (movie) {
          // Handle the case where a movie was found
          isBookmarked = true;
        },
      ),
    );
  }

  @observable
  bool isBookmarked = false; // New observable for bookmark status

  @action
  Future<void> toggleBookmark() async {
    if (detailMovie != null) {
      if (isBookmarked) {
        await _removeLocalMovie.call(detailMovie?.id ?? 0);
      } else {
        await _storeMovieToLocal.call(detailMovie!);
      }
      isBookmarked = !isBookmarked;
    }
  }
}
