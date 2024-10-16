import 'package:movies/data/model/genre_model.dart';

import '../../domain/entities/genre.dart';

class GenreMapper {
  static Genre toEntity(GenreModel model) {
    return Genre(
      id: model.id ?? 0,
      name: model.name ?? '',
    );
  }
}
