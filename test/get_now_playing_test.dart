import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movies_response.dart';
import 'package:movies/domain/repository/movie_repository.dart';
import 'package:movies/domain/usecase/retrieve_now_playing.dart';

import 'get_now_playing_test.mocks.dart';

@GenerateMocks([
  MovieRepository,
])
void main() {
  late RetrieveNowPlaying usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = RetrieveNowPlaying(mockMovieRepository);
  });

  final List<Movie> tMovies = [
    Movie(title: 'Test Movie', overview: 'Overview', posterPath: '/path.jpg')
  ];

  final response = MoviesResponse(
    page: 0,
    results: tMovies,
    totalPages: 1,
    totalResults: 1,
  );

  test('should get list of now playing movies from the repository', () async {
    // Arrange: Set up the repository to return a successful result
    when(mockMovieRepository.getNowPlayingMovies(1))
        .thenAnswer((_) async => Right(response));

    // Act: Call the use case
    final result = await usecase(1);

    // Assert: Check that the result matches the MoviesResponse
    expect(result, Right(response));

    // Verify: Ensure the repository method was called
    verify(mockMovieRepository.getNowPlayingMovies(1));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
