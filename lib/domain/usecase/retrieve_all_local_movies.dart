import 'package:dartz/dartz.dart';
import 'package:movies/core/failure.dart';
import 'package:movies/domain/repository/movie_local_repository.dart';
import 'package:movies/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import '../entities/movie.dart';

@LazySingleton()
class RetrieveAllLocalMovies implements UseCase<List<Movie>, NoParams> {
  final MovieLocalRepository _movieLocalRepository;

  RetrieveAllLocalMovies(this._movieLocalRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await _movieLocalRepository.getAllMovies();
  }
}
