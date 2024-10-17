import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/usecase/usecase.dart';

import '../entities/genre.dart';
import '../repository/movie_repository.dart';

@LazySingleton()
class RetrieveGenres implements UseCase<List<Genre>, NoParams> {
  final MovieRepository _movieRepository;

  RetrieveGenres(this._movieRepository);

  @override
  Future<Either<Failure, List<Genre>>> call(NoParams params) async {
    return await _movieRepository.getGenres();
  }
}
