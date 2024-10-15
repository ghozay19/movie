import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/core/constant/api_endpoints.dart';
import 'package:movies/presentation/movie_image_network.dart';
import 'package:shimmer/shimmer.dart';
import '../store/home_store.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStore = GetIt.I<HomeStore>();

    return Scaffold(
      appBar: AppBar(title: const Text("Now Playing Movies")),
      body: Observer(
        builder: (_) {
          if (homeStore.moviesFuture == null ||
              homeStore.moviesFuture!.status == FutureStatus.pending) {
            homeStore.fetchNowPlayingMovies();
            return _buildShimmer();
          }

          if (homeStore.moviesFuture!.status == FutureStatus.rejected) {
            return const Center(child: Text("Failed to fetch data"));
          }

          final movies = homeStore.moviesFuture!.value!;
          return ListView.builder(
            itemCount: movies.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    MovieImageNetwork(
                      imageUrl:
                          ApiEndpoints.baseImageUrl + movies[index].posterPath!,
                      width: 100,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(width: 100, height: 10, color: Colors.white),
            subtitle: Container(width: 200, height: 10, color: Colors.white),
          );
        },
      ),
    );
  }
}
