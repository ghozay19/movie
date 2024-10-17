// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movies/core/constant/api_endpoints.dart';
import 'package:movies/domain/entities/movie.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/movie_image_network.dart';
import '../store/detail_movie_store.dart';

@RoutePage()
class MovieDetailPage extends StatefulWidget {
  final Movie detailMovie;

  const MovieDetailPage({super.key, required this.detailMovie});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late DetailMovieStore detailStore;

  @override
  void initState() {
    super.initState();
    detailStore = GetIt.I<DetailMovieStore>();

    detailStore.setMovieId(widget.detailMovie);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
        actions: [
          Observer(builder: (_) {
            return IconButton(
              icon: Icon(
                detailStore.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
                color: detailStore.isBookmarked ? Colors.amber : Colors.grey,
              ),
              onPressed: () {
                detailStore.toggleBookmark();
              },
            );
          })
        ],
      ),
      body: Observer(
        builder: (_) {
          return Column(
            children: [
              MovieImageNetwork(
                imageUrl:
                    '${ApiEndpoints.baseImageUrl}${detailStore.detailMovie?.backdropPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
                borderRadius: const BorderRadius.all(Radius.circular(0)),
              ),
              Padding(
                padding: EdgeInsets.all(AppSizes.s8),
                child: Column(
                  children: [
                    Text(
                      detailStore.detailMovie?.title ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                    Text(detailStore.detailMovie?.overview ?? ''),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
