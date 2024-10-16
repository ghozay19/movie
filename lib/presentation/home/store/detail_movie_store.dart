import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/movie.dart';

part 'detail_movie_store.g.dart';

@injectable
class DetailMovieStore = _DetailMovieStore with _$DetailMovieStore;

abstract class _DetailMovieStore with Store {
  @observable
  Movie? detailMovie;

  @action
  void setMovieId(Movie movie) {
    detailMovie = movie;
  }
}
