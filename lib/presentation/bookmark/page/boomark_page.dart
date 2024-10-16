import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/core/constant/api_endpoints.dart';
import 'package:movies/presentation/bookmark/store/bookmark_store.dart';

import '../../movie_image_network.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movies/presentation/router/app_router.dart';

@RoutePage()
class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late BookmarkStore bookmarkStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bookmarkStore = GetIt.I<BookmarkStore>();
    bookmarkStore.fetchBookmarks(); // Fetch the latest bookmarks
  }

  @override
  void initState() {
    super.initState();
    bookmarkStore = GetIt.I<BookmarkStore>();
    bookmarkStore.fetchBookmarks(); // Fetch the latest bookmarks
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: Observer(
        builder: (_) {
          if (bookmarkStore.moviesFuture == null ||
              (bookmarkStore.moviesFuture!.status == FutureStatus.pending &&
                  bookmarkStore.movies.isEmpty)) {
            return const Center(child: CircularProgressIndicator());
          }
          final bookmarkedMovies = bookmarkStore.movies;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
            ),
            itemCount: bookmarkedMovies.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  final movieId = bookmarkedMovies[index];
                  AutoRouter.of(context)
                      .push(MovieDetailRoute(detailMovie: movieId));
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: MovieImageNetwork(
                      imageUrl:
                          '${ApiEndpoints.baseImageUrl}${bookmarkedMovies[index].posterPath ?? ''}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
